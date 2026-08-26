@echo off
start /b /wait cdtb fetch-hashes
start /b /wait ruby copyhashes.rb

start /b /wait snip-snip https://raw.communitydragon.org/latest/game/en_us/data/menu/en_us/ --filter "lol.stringtable.json" --overwrite=false -o "lang"

start /b /wait ruby bincompile.rb
start /b /wait ritobin -o info -i bin -r -d "Data/hashes/lol" "bins" "temp"

start /b /wait ruby stringtable.rb
start /b /wait ruby cleanup.rb
start /b /wait ruby keyword.rb
pause