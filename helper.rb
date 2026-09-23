require 'json'
require 'digest/xxhash'

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
def xxh3(s)
    return s if s.to_i(16).to_s(16) == s
    digest = Digest::XXH3_64bits.hexdigest(s)
    hashInt = digest.to_i(16)

    hashMask = (1 << 38) - 1

    return (hashInt & hashMask).to_s(16)
end

# file = {}
# File.open("aram\\data\\ChampionAugmentTagList.json", 'rb') { |f| file = JSON.parse(f.read) }

# h = {}
# file["0x287a10e0"]["0xbf9074a"].each { |v|
#     champ = v["championName"].split("/")[1]
#     h[v["WeightedCharacterAugmentList"]] = "ChampionAugmentList/#{champ}"
# }

# #file = file.transform_keys { |k| h[k] }.sort_by { |k, v| k }.to_h

# #File.open("aram\\data\\ChampionAugmentTagList.json", 'wb') { |f| f.write(JSON.pretty_generate(file)) }
#  puts JSON.pretty_generate(h)


# file = {}
# groups = {}
# augarr = []
# sourcedata = {}
# File.open("aram\\data\\ChampionAugmentList.json", 'rb') { |f| file = JSON.parse(f.read) }
# File.open("aram\\augmentgroups\\data\\AugmentGroups.json", 'rb') { |f| groups = JSON.parse(f.read) }
# File.open("aram/mayhem/augments/augments.json", 'rb') { |f| augarr = JSON.parse(f.read) }

spelltags = []
outlist = {}
path = "champions"
Dir.each_child("champions") { |d|
    next if d.include?("jade_")
    subpath = path + "/" + d + "/"
    root = {}
    spells = {}
    File.open(subpath + "BaseStats.json") { |f| root = JSON.parse(f.read()) }
    File.open(subpath + "Spells.json") { |f| spells = JSON.parse(f.read()) }
    rootkey = root.keys.find { |k| k.end_with?("Root") } || root.keys[0]
    name = root[rootkey]["name"]
    charname = root[rootkey]["mCharacterName"].downcase
    outlist[name] = {
        tags: [],
        arTypes: [],
        icon: "assets/characters/#{charname}/hud/#{charname}_square.png"
    }
    ["primaryAbilityResource", "secondaryAbilityResource"].each { |ar|
        resource = root[rootkey].dig(ar)
        next if !resource
        type = resource["arType"]
        next if !type
        outlist[name][:arTypes].push(type)
    }
    spells.each { |spell, data|
        next if !data["mSpell"]
        tags = data["mSpell"].fetch("mSpellTags", []) - [""]
        spelltags += tags
        outlist[name][:tags] += tags
    }
    spelltags.uniq!
    outlist[name][:tags].uniq!
}

#File.open("D:/league/Tooltips/Data/tags.json", 'wb') { |f| f.write(JSON.pretty_generate(spelltags)) }
File.open("D:/league/Tooltips/Data/champions.json", 'wb') { |f| f.write(JSON.pretty_generate(outlist)) }