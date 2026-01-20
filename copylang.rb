require 'fileutils'

FileUtils.rm("live.lol.stringtable.json")

FileUtils.cp("lang/lol.stringtable.json", "live.lol.stringtable.json")