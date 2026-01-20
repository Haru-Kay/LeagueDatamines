require 'json'

items = {}
File.open("items/items.json", 'rb') { |f| items = JSON.parse(f.read) }

out = Hash.new { |h, k| h[k] = {} }
items.each { |name, data|
    id = data["itemID"]
    begin
        kw = data["mItemDataClient"]["mTooltipData"]["mLocKeys"]["keyColloquialism"]
    rescue
        puts name 
        next
    end
    next if !kw
    arr = kw.split(";").map { |a| a.strip.downcase }.delete_if { |a| a.empty? }.uniq
    next if arr.empty?
    out[name][:id] = id
    out[name][:keys] = arr
}

File.open("items/itemKeywords.json", 'wb') { |f| f.write(JSON.pretty_generate(out.sort_by { |k, v| v[:id] }.to_h)) }