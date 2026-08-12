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
File.open("aram\\augmentgroups\\data\\AugmentGroups.json", 'rb') { |f| file = JSON.parse(f.read) }

h = {}
file.each { |k, v|
    h[k] = "AugmentGroups/#{v["ID"]}"
}

file = file.transform_keys { |k| h[k] }.sort_by { |k, v| k }.to_h


File.open("aram\\augmentgroups\\data\\AugmentGroups.json", 'wb') { |f| f.write(JSON.pretty_generate(file)) }