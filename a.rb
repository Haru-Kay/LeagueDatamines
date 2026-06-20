require 'json'
require 'fileutils'
require 'hashie'
require 'digest/xxhash'
require 'concurrent-ruby'

$manualHash = {}
txt = ""
File.open("lang/manualhash.txt", 'rb') { |f| 
    f.read.split("\n").each { |f|
        obf, name = f.split(" ")
        $manualHash.store(obf, name)
    }
}

def xxh3(s)
    return s if s.to_i(16).to_s(16) == s
    digest = Digest::XXH3_64bits.hexdigest(s)
    hashInt = digest.to_i(16)

    hashMask = (1 << 38) - 1

    return (hashInt & hashMask).to_s(16)
end

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

class LangHashWrapper
    attr_reader :hash
    def initialize(hash)
        @hash = hash
    end

    def fetch(*args)
        key = args[0]
        if key
            while key.start_with?("{") && key.end_with?("}")
                key = key[1..key.length - 1]
            end
            if key.start_with?("0x")
                key = key[2..]
            else
                key = xxh3(key)
            end
        end
        ret = $manualHash.dig(key)
        return ret if !ret.nil?
        return @hash.fetch(key, *args[1..])
    end

    def dig(key)
        @hash.dig(xxh3(key))
    end

    def [](key)
        self.dig(key)
    end

    def method_missing(method, *args, &block)
        if @hash.respond_to?(method)
            @hash.send(method, *args, &block)
        else
            super
        end
    end

    def respond_to_missing?(method, include_private = false)
        @hash.respond_to?(method) || super
    end
end

def runlang(str, questData)
    count = questData["questDesc"].length
    for i in 0...count
        puts (str.downcase + i.to_s).inspect + " => " + $lang.fetch(str.downcase + i.to_s, str + i.to_s).inspect
    end
end

pool = Concurrent::FixedThreadPool.new(7)
File.open("lang/stringtable.json", 'rb') { |f| 
    text2 = ""
    $lang = JSON.parse(f.read())
    $lang.each { |k, v|
        pool.post {
            text = v
            while text[/@(.*?)@/]
                var = $~[1].gsub(" ", "_")
                var = var.split("*")[0] if var.include?("*")
                if !$manualHash.value?(var)
                    $manualHash.store(fnv(var.downcase), var)
                end
                text = $~.post_match
            end
        }
    }
}


File.open("lang/manualhash.txt", 'wb') { |f| 
    $manualHash.each { |k, v| f.write(k + " " + v + "\n") }
}