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

hash = {}
txt = ""
File.open("lang/manualhash.txt", 'rb') { |f| txt = f.read }
txt.split("\n").each { |f|
    obf, name = f.split(" ")
    hash.store(obf, name)
}

strangeChildren = {}

Dir.each_child("champions") { |file|
    path = "champions/#{file}/Spells.json"
    File.open(path, 'rb') { |f| 
        JSON.parse(f.read).each { |key, object|
            mSpell = object.dig("mSpell")
            spellName = object.fetch("ObjectName", key)
            if mSpell
                dataValues = mSpell["DataValues"]
                dataValues&.each { |dv|
                    name = dv["name"]
                    name.gsub!(" ", "")
                    hash.store(fnv(name.downcase), name)
                    
                    values = dv["values"]
                    next if !values
                    next if values.uniq.length == 1
                    oldValue = (values[2] - values[1]).round(3)
                    valueChecks = values[1...values.length - 1]
                    valueChecks = values if ["jayce", "udyr"].include?(file)
                    lastVal = valueChecks[0]
                    count = {
                        lastVal => 1
                    }
                    valueChecks.delete_if { |v| 
                        next true if (v > lastVal && oldValue.negative?) || (v < lastVal && oldValue.positive?)
                        next false if v == valueChecks[0]
                        count[v] ||= 0
                        count[v] += 1
                        lastVal = v
                        next false
                    }
                    count.each { |k, v|
                        valueChecks.delete(k) if v > 1
                    }
                    for i in 2...valueChecks.length
                        next if valueChecks.uniq.length == 3
                        if (valueChecks[i] - valueChecks[i - 1]).round(3) != oldValue 
                            strangeChildren[file] ||= {}
                            strangeChildren[file][spellName] ||= {}
                            strangeChildren[file][spellName][name] = values
                            break
                        end
                    end
                }
            end
        }
    }
}

# File.open("items/items.json", 'rb') { |f| 
    
#     JSON.parse(f.read).each { |item, aug|
#         mDataValues = aug.dig("mDataValues")
#         next if !mDataValues
#         mDataValues.each { |dataValue|
#             name = dataValue["mName"]
#             name.gsub!(" ", "")
#             hash.store(fnv(name.downcase), name)
#         }
#     }
#     # JSON.parse(f.read).each { |_, string|
#     #     #puts string.class
#     #     string.gsub(/@([^@]+)@/) { |m|
#     #         name = m[1..-2]
#     #         name = name[...name.index("*")] if name.include?("*")
#     #         name.gsub!(" ", "")
#     #         hash.store(fnv(name.downcase), name)
#     #         name
#     #     }
#     # }
# }

str = ""
hash.each { |obf, name|
    str += "#{obf} #{name}\n"
}

File.open("lang/manualhash.txt", 'wb') { |f| f.write(str) } 

File.open("strangeChildrenInLeague.txt", 'wb') { |f| f.write(JSON.pretty_generate(strangeChildren)) }