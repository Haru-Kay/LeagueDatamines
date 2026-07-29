require 'json'
require 'fileutils'
require 'hashie'
require 'digest/xxhash'
require 'concurrent-ruby'

kiwiList = {}
kiwiInfo = {}
jadeList = {}
jadeInfo = {}

File.open("aram/mayhem/data/AugmentInfo.json", 'rb') { |f| kiwiInfo = JSON.parse(f.read).transform_values { |v| [v["NameTra"], v["rarity"] || 0] }}
File.open("aram/mayhem/data/AugmentList.json", 'rb') { |f| kiwiList = JSON.parse(f.read).values[0]["AugmentList"] }
File.open("aram/jade/data/AugmentInfo.json", 'rb') { |f| jadeInfo = JSON.parse(f.read).transform_values { |v| [v["NameTra"], v["rarity"] || 0] }}
File.open("aram/jade/data/AugmentList.json", 'rb') { |f| jadeList = JSON.parse(f.read).values[0]["AugmentList"] }

removed = (kiwiList - jadeList).map { |f| kiwiInfo[f][0] }

newA = (jadeList - kiwiList).map { |f| "**" + jadeInfo[f][0] + " (#{["Silver", "Gold", "Prismatic"][jadeInfo[f][1]]})**\n\n* \n\n"}

puts newA