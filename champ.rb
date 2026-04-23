require 'json'

champs = []

Dir.each_child("champions") {|ch|
    path = "champions/#{ch}/BaseStats.json"
    File.open(path, 'rb') { |f| 
        JSON.parse(f.read).each_value { |root| champs.push(root.dig("name")) }
        
    }
}

puts champs.uniq.join("").gsub(/[^A-Za-z]/, "").downcase.count("p")