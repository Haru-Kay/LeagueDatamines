require 'concurrent-ruby'
require 'fileutils'
loc, fluff = *ARGV 
loc = "C:/Program Files (x86)/Riot Games/League of Legends/League of Legends" if !loc
loc = "D:/Games/Riot Games/League of Legends (PBE)" if loc.to_i == 1

path = "#{loc}/Game/DATA/FINAL/"

pool = Concurrent::FixedThreadPool.new(7)
maps = {
    11 => ["classic", "ruby", "swiftplay", "ultbook", "urf"],
    12 => ["aram", "augments", "firstblood", "ultbook", "kiwi"],
    21 => ["nexusblitz"],
    30 => ["cherry"],
    33 => ["strawberry"],
    35 => ["brawl"]
}

maps.each { |mapId, mapArr|
    pool.post {
        system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Map#{mapId}.wad.client\" -o \"#{Dir.getwd}/bins\" -x \"^data/maps/shipping/map#{mapId}/map#{mapId}.bin$\"")
        puts "Generated map#{mapId} shipping bin"
    }
    Dir.mkdir("#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/") unless Dir.exist?("#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/")
    Dir.mkdir("#{Dir.getwd}/bins/data/temp/map#{mapId}") unless Dir.exist?("#{Dir.getwd}/bins/data/temp/map#{mapId}")
    pool.post {
        system("./wadtools -L error --progress false e -i \"#{path}Maps/Shipping/Map#{mapId}.wad.client\" -o \"#{Dir.getwd}/bins/data/temp/map#{mapId}\" -x \"^maps/modespecificdata/.*?\.bin$\"")
        
        FileUtils.mv(Dir.glob("#{Dir.getwd}/bins/data/temp/map#{mapId}/maps/modespecificdata/*/*"), "#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/")
        FileUtils.mv(Dir.glob("#{Dir.getwd}/bins/data/temp/map#{mapId}/maps/modespecificdata/*"), "#{Dir.getwd}/bins/data/maps/modespecificdata/map#{mapId}/")
        puts "Generated map#{mapId} modedata bins"
    }
}

pool.shutdown
pool.wait_for_termination
