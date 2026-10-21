require 'json'


def recurDir(path)
  $tries ||= 0
  Dir.each_child(path) { |child|
    next if [
      ".git", "Data", "filediffs", "strings", "temp", "tempBins", "bins"
    ].include?(child)
    p path + child
    #return if $tries > 30
    if Dir.exist?(path + child)
      recurDir(path + child + "/")
    else
      sortFile(path + child) if child.end_with?(".json")
    end
    $tries += 1
  }
end

def sortFile(path)
  json = nil
  File.open(path, 'rb') { |f|
    begin
      json = JSON.parse(f.read)
    rescue
      json = nil
    end
  }
  return false if json.nil? || !json.is_a?(Hash)
  return false if json.key?("objects")
  linked = json.delete("__linked")
  json = {
    "linked" => linked,
    "objects" => json
  }
  File.open(path, 'wb') { |f| f.write(JSON.pretty_generate(hashSort(json))) }
  return true
end

def hashSort(obj)
  case obj
    when Hash
      ret = obj.transform_keys { |k| 
        next "0x#{k[1...-1]}" if k.start_with?("{") && k.end_with?("}")
        next "~class" if k == "__type"
        next k
      }.sort_by { |k, v| k }.to_h
      return ret.transform_values { |v| hashSort(v) }
    when Array
      return obj.map { |v| hashSort(v) }
    when String
      return obj.start_with?("{") && obj.end_with?("}") ? "0x#{obj[1...-1]}" : obj
    else
      return obj
  end
end

recurDir "D:/CommunityDragon/temp/"