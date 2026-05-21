require 'json'

path = "champions/"
abilityflags = {}
Dir.each_child(path) { |c|
    File.open(path + c + "/AbilityObject.json", 'rb') { |f|
        abilityObjects = JSON.parse(f.read)
        abilityObjects.each { |_, data|
            name = data["mName"]
            flags = data["AbilityTraits"]
            next if !flags
            
            n = 16
            while n > 0 && flags > 0
                tag = 2**n
                if flags - tag >= 0
                    abilityflags[tag] ||= []
                    abilityflags[tag].push(c + ": " + name)
                    flags -= tag
                end
                n -= 1
            end
        }
    }
}

puts abilityflags[2048]