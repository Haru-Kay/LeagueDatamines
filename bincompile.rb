require 'concurrent-ruby'
require 'fileutils'
loc, fluff = *ARGV 
loc = "C:/Program Files (x86)/Riot Games/League of Legends/League of Legends" if !loc
loc = "D:/Games/Riot Games/League of Legends (PBE)" if loc.to_i == 1

path = "#{loc}/Game/DATA/FINAL/"
champs = []

filter = [
    "tft_"
]
Dir.each_child(path + "Champions") { |d|
    next if filter.any? { |f| d.downcase.start_with?(f) }
    champs.push(d.split(".")[0])
    champs.uniq!
}

pool = Concurrent::FixedThreadPool.new(7)
champs.each { |champ|
    pool.post { 
        system("./wadtools -L error --progress false e -i \"#{path}Champions/#{champ}.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^data/characters/(.*?)/\\1\\.bin$\"")
        puts "Generated #{champ} bin"
    }
}

pool.post { 
    system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Map11.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^data/characters/(.*?)/\\1\\.bin$\"")
    puts "Generated #{champ} bin"
}

pool.post {
    system("./wadtools -L error --progress false e -i \"#{path}Localized/Global.en_US.wad.client\" -o \"D:/CommunityDragon/bins/data/menu/en_us/\"")
    system("./ruby stringtable.rb")
    puts "Generated stringtable"
}


pool.post {
    system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Common.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^data/maps/shipping/common/common.bin$\"")
    puts "Generated common bin"
}

maps = {
    11 => ["classic", "ruby", "swiftplay", "ultbook", "urf"],
    12 => ["aram", "augments", "firstblood", "ultbook"],
    21 => ["nexusblitz"],
    30 => ["cherry"],
    33 => ["strawberry"],
    35 => ["brawl"]
}

maps.each { |mapId, mapArr|
    pool.post {
        system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Map#{mapId}.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^data/maps/shipping/map#{mapId}/map#{mapId}.bin$\"")
        puts "Generated map#{mapId} bin"
    }
    mapArr.each { |map|
        Dir.mkdir("#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/") unless Dir.exist?("#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/")
        pool.post {
            system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Map#{mapId}.wad.client\" -o \"#{Dir.getwd}/bins/data\" -x \"^maps/modespecificdata/#{map}.bin$\"")
            FileUtils.mv("#{Dir.getwd}/bins/data/maps/modespecificdata/#{map}.bin", "#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/#{map}.bin")
            puts "Generated #{map} bin"
        }
    }
}
pool.post {
    system("./wadtools -L error --progress false e -i \"#{path}Global.wad.client\" -o \"#{Dir.getwd}/bins/data\" -x \"^items$\"")
    puts "Generated items bin"
}
pool.post {
    system("./wadtools -L error --progress false e -i \"#{path}Global.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^globals$\"")
    puts "Generated loadtip bin"
}

pool.post {
    system("./wadtools -L error --progress false e -i \"#{path}Global.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^perks$\"")
    puts "Generated perks bin"
}

pool.shutdown
pool.wait_for_termination
