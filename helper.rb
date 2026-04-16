require 'json'

=begin
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

=end



def augmentExtract(key, data, augmentTags, buildTags)
    return augmentTags, buildTags if data.dig("Enabled") == false
    
    augmentTag = data.fetch("mAugmentTags", 0)
    buildTag = data.fetch("mBuildTags", 0)
    name = data["NameTra"].strip

    tags = []
    n = 16
    while n > 0 && augmentTag > 0
        tag = 2**n
        if augmentTag - tag >= 0
            tags.push(tag)
            augmentTag -= tag
        end
        n -= 1
    end
    tags.push(0) if tags.empty?
    tags.each { |tag|
        augmentTags[tag] ||= []
        augmentTags[tag].push(name) unless augmentTags[tag].any? {|n| n.downcase == name.downcase }
    }

    tags = []
    n = 16
    while n > 0 && buildTag > 0
        tag = 2**n
        if buildTag - tag >= 0
            tags.push(tag)
            buildTag -= tag
        end
        n -= 1
    end
    tags.push(0) if tags.empty?

    tags.each { |tag|
        buildTags[tag] ||= []
        buildTags[tag].push(name) unless buildTags[tag].any? {|n| n.downcase == name.downcase }
    }
    return augmentTags, buildTags
end

def championExtract(char, champTags)
    name = char["championName"].split("/")[1]
    includeTags = char["mBuildTags"]
    excludeTags = char["mExcludedTags"]

    included = []
    n = 16
    while n > 0 && includeTags > 0
        tag = 2**n
        if includeTags - tag >= 0
            included.push(tag)
            includeTags -= tag
        end
        n -= 1
    end
    included.sort!

    excluded = []
    n = 16
    while n > 0 && excludeTags > 0
        tag = 2**n
        if excludeTags - tag >= 0
            excluded.push(tag)
            excludeTags -= tag
        end
        n -= 1
    end
    excluded.sort!

    champTags[name] = {
        included: included,
        excluded: excluded
    }

    return champTags
end

def export(champTags, buildTags, augmentTags, filename)
    csv = "Champion,Included,Excluded\n"
    champTags.each { |name, tags|
        included = []
        tags[:included].each { |t| included += buildTags[t] }
        excluded = []
        tags[:excluded].each { |t| excluded += augmentTags[t] }
        intersect = included.intersection(excluded)
        included -= intersect
        excluded -= intersect

        csv += name
        csv += ",\""
        csv += included.uniq.sort_by { |a| a.downcase }.join("\n")
        csv += "\",\""
        csv += excluded.uniq.sort_by { |a| a.downcase }.join("\n")
        csv += "\"\n"
    }

    File.open("#{filename}.csv", 'wb') { |f| f.write(csv) }
end

cherry = {}
kiwi = {}
aug1 = {}
aug2 = {}
aug3 = {}

File.open("arena/data/AugmentInfo.json", 'rb') { |f| aug1 = JSON.parse(f.read()) }
File.open("arena/cherry/data/AugmentInfo.json", 'rb') { |f| aug2 = JSON.parse(f.read()) }
File.open("aram/mayhem/data/AugmentInfo.json", 'rb') { |f| aug3 = JSON.parse(f.read()) }
cherryAugmentTags = {}
cherryBuildTags = {}
kiwiAugmentTags = {}
kiwiBuildTags = {}

cherry = aug1.merge(aug2)
kiwi = aug3

kiwi.each { |key, data|
    kiwiAugmentTags, kiwiBuildTags = augmentExtract(key, data, kiwiAugmentTags, kiwiBuildTags)
}
cherry.each { |key, data|
    cherryAugmentTags, cherryBuildTags = augmentExtract(key, data, cherryAugmentTags, cherryBuildTags)
}

=begin
0   : Generic
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

kiwiAugmentTags = kiwiAugmentTags.sort_by { |k, v| k }.to_h.each { |tag, augs|
    augs.sort_by! {|a| a.downcase }
}
kiwiBuildTags = kiwiBuildTags.sort_by { |k, v| k }.to_h.each { |tag, augs|
    augs.sort_by! {|a| a.downcase }
}

cherryAugmentTags = cherryAugmentTags.sort_by { |k, v| k }.to_h.each { |tag, augs|
    augs.sort_by! {|a| a.downcase }
}
cherryBuildTags = cherryBuildTags.sort_by { |k, v| k }.to_h.each { |tag, augs|
    augs.sort_by! {|a| a.downcase }
}


cherryChampTags = {}

cherryTagList = []
File.open("arena/data/ChampionAugmentTagList.json", 'rb') { |f| cherryTagList = JSON.parse(f.read).values[0].values[0] }

cherryTagList.each { |char|
    cherryChampTags = championExtract(char, cherryChampTags)
}

kiwiChampTags = {}

kiwiTagList = []
File.open("aram/data/ChampionAugmentTagList.json", 'rb') { |f| kiwiTagList = JSON.parse(f.read).values[0].values[0] }

kiwiTagList.each { |char|
    kiwiChampTags = championExtract(char, kiwiChampTags)
}

augmentTagList = {
    0 => "Generic",
    2 => "AP Scaling",
    4 => "AD Scaling",
    8 => "Mana Scaling",
    16 => "Health Scaling",
    32 => "Requires Dash",
    64 => "Summoner Spells",
    128 => "AP Capstones",
    256 => "ADC Capstones",
    512 => "Tank Capstones",
    1024 => "Requires Castable Ult",
    2048 => "Self Heal/Shield",
    4096 => "Ally Heal/Shield",
}

buildTagList = {
    0 => "Generic",
    2 => "Assassin?",
    4 => "Burns",
    8 => "Support",
    16 => "Fighter?",
    32 => "Mage?",
    64 => "Auto Attacker?",
    128 => "Caster?",
    256 => "Tank?",
    512 => "Crit Based",
    1024 => "Autocasts",
    2048 => "Fighter Caster?",
}

maxTags = 0
maxChamp = 0
minTags = 99
minChamp = []

kiwiChampTags.each { |ch, t|
    i = t[:included]
    if i.length > maxTags
        maxTags = i.length
        maxChamp = [ch, i]
    end
    if i.length == 1
        minTags = i.length
        minChamp.push([ch, i])
    end
}

puts maxChamp
puts minChamp.length

export(kiwiChampTags, kiwiBuildTags, kiwiAugmentTags, "Mayhem Champion Augments")
export(cherryChampTags, cherryBuildTags, cherryAugmentTags, "Arena Champion Augments")