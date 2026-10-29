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

augs = {}
File.open("aram/data/RewardGroup.json", 'rb') { |f| augs = JSON.parse(f.read) }

out = ""
augs.each { |_, data|
    name = data["internalName"].split("/")[-1]
    rewards = []
    data["rewards"].each { |reward|
        rewards.push(reward["0x31c5f01c"])
    }
    out += "#{name}: " + rewards.join(", ") + "\n"
}

puts out