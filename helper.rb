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
File.open("aram/mayhem/augments/augments.json", 'rb') { |f| augs = JSON.parse(f.read) }

out = {}
augs.each { |data|
    icons = data["icons"]
    next unless icons.any? { |icon| icon.start_with?("0x") }
    out[data["apiName"]] = {
        :name => data["name"],
        :icon => []
    }
    icons.each { |icon|
        out[data["apiName"]][:icon].push(icon[2..]) if icon.start_with?("0x")
    }
}

puts JSON.pretty_generate(out)