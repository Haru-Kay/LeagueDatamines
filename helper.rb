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

file = {}
File.open("aram\\data\\ChampionAugmentTagList.json", 'rb') { |f| file = JSON.parse(f.read) }

h = {}
file["0x287a10e0"]["0xbf9074a"].each { |v|
    champ = v["championName"].split("/")[1]
    h[v["WeightedCharacterAugmentList"]] = "ChampionAugmentList/#{champ}"
}

#file = file.transform_keys { |k| h[k] }.sort_by { |k, v| k }.to_h

#File.open("aram\\data\\ChampionAugmentTagList.json", 'wb') { |f| f.write(JSON.pretty_generate(file)) }
 puts JSON.pretty_generate(h)