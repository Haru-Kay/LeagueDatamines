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


file = {}
groups = {}
augarr = []
sourcedata = {}
File.open("aram\\data\\ChampionAugmentList.json", 'rb') { |f| file = JSON.parse(f.read) }
File.open("aram\\augmentgroups\\data\\AugmentGroups.json", 'rb') { |f| groups = JSON.parse(f.read) }
File.open("aram/mayhem/augments/augments.json", 'rb') { |f| augarr = JSON.parse(f.read) }
augarr.each { |aug|
    sourcedata.store(aug["apiName"], aug["name"])
}
champs = file.keys

groupListings = groups.keys.map { |k| [k, []] }.to_h
groups.keys.each { |key|
    file.each { |c, augs| 
        groupListings[key].push(c) if augs.keys.include?(key)
    }
}

# groupListings.sort_by { |k, v| v.length }.to_h.each { |g, a|
#     puts "#{g} => #{a.length}"
# }

p groupListings["Peel"]

# mages = groups.filter { |group, augs| group == "MageAugmentsGeneric" || group == "MageAugmentsGeneric4"}
# puts groups["AH"] - groups["HasteAugments"]
# puts "--------------------------------"
# puts groups["HasteAugments"] - groups["AH"]

# mages = groups.filter { |group, augs| group.include?("Mage") }
# matching = mages.values[0].intersection(*mages.values[1..])
# mages.each { |group, augs| puts group + " => #{augs - matching}\n================\n" }


# list = file["Neeko"]
# augments = {}

# list.each { |group, weight|
#     groups[group].each { |aug|
#         if augments[aug]
#             augments[aug] += weight
#         else
#             augments.store(aug, weight)
#         end
#     }
# }

# puts "Neeko:"
# puts "Weight => Augments"
# augmentsByWeight = {}
# augments.each { |k, v|
#     augmentsByWeight[v] ||= []
#     augmentsByWeight[v].push(k)
# }
# augmentsByWeight.sort_by { |k, v| k }.each { |k, v| puts "#{k} => #{v.map { |a| sourcedata.fetch(a, a)}.inspect.gsub("\"", "")}"}