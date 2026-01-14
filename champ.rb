require 'json'

$champLang = []
File.open("game-data/champion-summary.json", 'rb') { |f| 
    c = JSON.parse(f.read()) 
    c.each { |champ|
        next if !champ.is_a?(Hash)
        next if champ["alias"]&.include?("_")
        next if champ["alias"] == "None"
        id = champ["id"]
        name = champ["name"].gsub("'", "").gsub("& Willump", "")
        $champLang.push(name)
    }
}

puts "champs: " + $champLang.sort.join(",")

puts "\n"

