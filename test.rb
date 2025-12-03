require 'base64'
require 'digest/xxhash'
require 'json'

class CustomParser
  attr_accessor :file
  attr_accessor :pos
  def initialize(file)
    @file = file
    @pos = 0
  end

  def unpack(fmt)
    return read(calcsize(fmt)).unpack(fmt)
  end

  def read(length)
    read = @file[@pos...@pos + length]
    @pos += length
    return read
  end

  def calcsize(fmt)
    i = 0
    total = 0

    while i < fmt.length
      c = fmt[i]

      if c =~ /\s/
        i += 1
        next
      end

      if c == '\\'
        i += 2
        next
      end

      if c == "<" || c == ">"
        i += 1
        next
      end

      j = i + 1
      while j < fmt.length && fmt[j] =~ /\d/
        j += 1
      end
      count = fmt[i + 1...j].to_i
      count = 1 if count == 0

      case c
        when 'C', 'c' then size = 1
        when 'S', 's' then size = 2
        when 'L', 'l', 'I', 'i' then size = 4
        when 'Q', 'q' then size = 8
        when 's', 'S', 'l', 'L', 'q', 'Q'
          size = { 
            's' => 2,
            'S' => 2,
            'l' => 4,
            'L' => 4,
            'q' => 8,
            'Q' => 8
          }[c]
        when 'f' then size = 4
        when 'd' then size = 8
        when 'a', 'A', 'Z'
          if count == 1
            raise ArgumentError, "String directive '#{c}' must have a count"
          end
          size = count
        when 'x' then size = count
        when '@'
          pos = fmt[i+1...j].to_i
          total = pos
          size = 0
        else
          raise ArgumentError, "Unsupported directive #{c.inspect}"
      end

      total += size
      i = j
    end

    return total
  end
end

def intFromBytes(data, endian = :little)
  bytes = data.dup
  bytes.reverse if endian == :little
  return bytes.unpack1("H*").to_i(16)
end

def parse_rst(path)
  stringtable = nil
  File.open(path, 'rb') { |f|
    stringtable = f.read()
  }
  parser = CustomParser.new(stringtable)
  magic, version = parser.unpack("a3C")
  fontConfig = nil
  hashBits = 40

  if magic != "RST"
    puts "invalid magic code"
    return
  end
  if version == 2
    if parser.unpack("C")
      n, _ = parser.unpack("L<")
      fontConfig = parser.read(n).force_encoding("UTF-8")
    end
  elsif version == 3
    # do nothing
  elsif [4, 5].include?(version)
    hashBits = 38
  else
    puts "unsupported RST version #{version}"
    return
  end

  hashMask = (1 << hashBits) - 1
  count, _ = parser.unpack("L<")
  entries = []
  for i in 0...count
    v, _ = parser.unpack("Q<")
    entries.append([v >> hashBits, v & hashMask])
  end

  hasTrenc = false

  data = parser.file[parser.pos...]
  ret = {}
  for index in 0...entries.length
    entry = entries[index]
    i, h = entry
    e = data.index("\0", i) || data.length
    d = data[i...e]
    ret.store("%x" % h, d.force_encoding("UTF-8"))
  end

  return ret
end

entries = parse_rst("bins/data/menu/en_us/data/menu/en_us/lol.stringtable")
File.open("temp/stringtable.json", 'wb') { |f|
  f.write(JSON.pretty_generate(entries))
}