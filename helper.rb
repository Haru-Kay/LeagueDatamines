require 'json'

files = []

["aram", "arena", "champions", "characters", "items", "summonersRift"].each { |f|
    files += Dir.glob("#{f}/**/*Spell*.json")
}

spells = []

files.each { |f| 
    json = {}
    File.open(f, 'rb') { |d| json = JSON.parse(d.read()) }
    next if !json || !json.is_a?(Hash)
    
    json.each { |k, v|
        begin
            if v.dig("mSpell")&.key?("mIsDisabledWhileDead")
                spells.push(v.fetch("ObjectName", k))
            end
        rescue
            raise f
        end
    }
}

File.open("persists.json", 'wb') { |f| f.write(JSON.pretty_generate(spells)) }