require 'json'

def fnv(item, size: 32)
    offset_basis = 0x811c9dc5
    prime = 16777619

    hash = offset_basis
    item.to_s.each_byte { |byte|
        hash ^= byte
        hash *= prime
        hash &= 4294967295
    }
    
    return hash.to_s(16)
end

hash = {}
File.open("arena/augments/augments.json", 'rb') { |f| 
    JSON.parse(f.read).each { |aug|
        dataValues = aug.dig("dataValues")
        next if !dataValues
        dataValues.each { |name, value|
            hash.store(fnv(name.downcase), name)
        }
    }
}

str = ""
hash.each { |obf, name|
    str += "#{obf} #{name}\n"
}

File.open("lang/manualhash.txt", 'wb') { |f| f.write(str) } 







=begin
kiwi = {}


File.open("temp/data/maps/modespecificdata/map12/kiwi.json", 'rb') { |f| kiwi = JSON.parse(f.read()) }
augTags = {}

kiwi["entries"].each { |key, data|
    next if data.dig("~class") != "AugmentData"
    tag = data.fetch("mAugmentTags", -1)
    augTags[tag] ||= []
    name = data.fetch("AugmentNameId", key)

    augTags[tag].push(name)
}

-1  : Generic
2   : Mage-related
4   : AD/AS-related
6   : Sheen + Master of Duality
8   : Requires Mana (NOTE: NOT BUFF BUDDIES)
16  : Requires CC
18  : Cruelty
32  : Requires Dash
64  : Summoner Spells
128 : Trueshot
256 : Critical Missile
260 : ADC Capstones?
384 : Skilled Sniper
512 : Tank-related
1024: Requires Ultimate
2048: Shield Buffs?
2050: Circle of Death
4096: Literal HSP scaling?
4160: Upgrade: Mikael's
6144: Shield related? CrackOpenThatEgg + BabyKitty
6208: Empyrean Promise (Can get Empyrean + Summoner change???)
=end