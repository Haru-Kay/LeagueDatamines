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

# hash = {}
# txt = ""
# File.open("lang/manualhash.txt", 'rb') { |f| txt = f.read }
# txt.split("\n").each { |f|
#     obf, name = f.split(" ")
#     hash.store(obf, name)
# }
# File.open("aram/mayhem/augments/augments.json", 'rb') { |f| 
#     JSON.parse(f.read).each { |aug|
#         dataValues = aug.dig("dataValues")
#         if dataValues
#             dataValues.each { |name, value|
#                 hash.store(fnv(name.downcase), name) unless hash[fnv(name.downcase)]
#             }
#         end

#         desc = aug.dig("desc")
#         if desc
#             str = desc.gsub(/@([^@]+)@/) { |m|
#                 var = m[1..-2].split("*")[0]
#                 hash.store(fnv(var.downcase), var) unless hash[fnv(var.downcase)]
#             }
#         end
#         tooltip = aug.dig("tooltip")
#         if tooltip
#             str = tooltip.gsub(/@([^@]+)@/) { |m|
#                 var = m[1..-2].split("*")[0]
#                 hash.store(fnv(var.downcase), var) unless hash[fnv(var.downcase)]
#             }
#         end
#     }
# }

# str = ""
# hash.each { |obf, name|
#     str += "#{obf} #{name}\n"
# }

# strangeChildren = {}

# Dir.each_child("champions") { |file|
#     path = "champions/#{file}/Spells.json"
#     File.open(path, 'rb') { |f| 
#         JSON.parse(f.read).each { |key, object|
#             mSpell = object.dig("mSpell")
#             spellName = object.fetch("ObjectName", key)
#             if mSpell
#                 dataValues = mSpell["DataValues"]
#                 dataValues&.each { |dv|
#                     name = dv["name"]
#                     name.gsub!(" ", "")
#                     hash.store(fnv(name.downcase), name)
                    
#                     values = dv["values"]
#                     next if !values
#                     next if values.uniq.length == 1
#                     oldValue = (values[2] - values[1]).round(3)
#                     valueChecks = values[1...values.length - 1]
#                     valueChecks = values if ["jayce", "udyr"].include?(file)
#                     lastVal = valueChecks[0]
#                     count = {
#                         lastVal => 1
#                     }
#                     valueChecks.delete_if { |v| 
#                         next true if (v > lastVal && oldValue.negative?) || (v < lastVal && oldValue.positive?)
#                         next false if v == valueChecks[0]
#                         count[v] ||= 0
#                         count[v] += 1
#                         lastVal = v
#                         next false
#                     }
#                     count.each { |k, v|
#                         valueChecks.delete(k) if v > 1
#                     }
#                     for i in 2...valueChecks.length
#                         next if valueChecks.uniq.length == 3
#                         if (valueChecks[i] - valueChecks[i - 1]).round(3) != oldValue 
#                             strangeChildren[file] ||= {}
#                             strangeChildren[file][spellName] ||= {}
#                             strangeChildren[file][spellName][name] = values
#                             break
#                         end
#                     end
#                 }
#             end
#         }
#     }
# }

# File.open("characters/shared/locke/s.json", 'rb') { |f| 
    
#     # JSON.parse(f.read).each { |item, aug|
#     #     mDataValues = aug.dig("mDataValues")
#     #     next if !mDataValues
#     #     mDataValues.each { |dataValue|
#     #         name = dataValue["mName"]
#     #         name.gsub!(" ", "")
#     #         hash.store(fnv(name.downcase), name)
#     #     }
#     # }
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

# str = ""
# hash.each { |obf, name|
#     str += "#{obf} #{name}\n"
# }

# File.open("lang/manualhash.txt", 'wb') { |f| f.write(str) } 

# File.open("strangeChildrenInLeague.txt", 'wb') { |f| f.write(JSON.pretty_generate(strangeChildren)) }


class AugmentTags
    attr_accessor :fieldA
    attr_accessor :fieldB
    attr_accessor :champ
    attr_accessor :tags

    def initialize(name, data)
        @fieldA = data["0x248cf7db"]
        @fieldB = data["0xbefd6d18"]
        @champ = name
        @tags = []
    end
end

augmentTags = {}
File.open("aram/data/ChampionAugmentTagList.json", 'rb') { |f| 
    json = JSON.parse(f.read) 
    json["0x287a10e0"]["0xbf9074a"].each { |c|
        name = c["championName"].split("/")[1].downcase
        augmentTags[name] = AugmentTags.new(name, c)
    }
}


# augmentTags.each { |name, data|
#     print name + ", " if data.fieldA.include?("0x8b9b519f")
# }

# augmentTags["RekSai"].fieldA.sort { |a, b| readoutsA[a].length <=> readoutsA[b].length }.each { |f|
#     puts f + " :: " + readoutsA[f].length.to_s
# }


root = "champions/"

Dir.each_child(root) { |child|
    path = root + child + "/"
    spells = []
    File.open(path + "AbilityObject.json", 'rb') { |f|
        j = JSON.parse(f.read)
        j.each { |_, data|
            spells.push(data["mRootSpell"])
        }
    }
    spells.each { |s|
        File.open(path + "Spells.json", 'rb') { |f|
            j = JSON.parse(f.read)
            if j[s]
                spellTags = j[s]["mSpell"]["mSpellTags"] || []
                augmentTags[child].tags += spellTags
            end
        }
    }
    augmentTags[child].tags.uniq!
}

readoutsA = {}
readoutsB = {}

augmentTags.each { |name, data|
    data.fieldA.each { |f|
        readoutsA[f] ||= []
        readoutsA[f].push(name)
    }
    data.fieldB.each { |f|
        readoutsB[f] ||= []
        readoutsB[f].push(name)
    }
}

# traits = []
# readoutsA["0xeedd1ba"].each { |f|
#     puts f
#     if traits.empty?
#         traits = augmentTags[f].tags
#     else
#         traits = traits & augmentTags[f].tags
#     end
# }

# puts traits

#augmentTags.each { |a, v| puts a if !v.tags.include?("Trait_SignatureSpell")}

readoutsB.each { |d, v|
    n = false
    [
        "aphelios", "aurora", "hwei", "sona", "locke"
    ].each { |f|
        (n = true; break) if !v.include?(f)
    }
    next if n
    puts "#{d} :: #{v.length}"
}

# puts "a: "
# readoutsA.sort_by { |k, v| v.length }.to_h.each { |k, v|
#     puts k + " :: " + v.length.to_s
# }

# puts "============================="
# puts "b: "
# readoutsB.sort_by { |k, v| v.length }.to_h.each { |k, v|
#     puts k + " :: " + v.length.to_s
# }