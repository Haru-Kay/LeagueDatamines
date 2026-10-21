@echo off
start /b /wait cdtb fetch-hashes
start /b /wait ruby copyhashes.rb

start /b /wait snip-snip https://raw.communitydragon.org/pbe/game/en_us/data/menu/en_us/ --filter "lol.stringtable.json" --overwrite=false -o "lang"

start /b /wait ruby bincompile.rb 1
start /b /wait ritobin-tools -L warning  -H "Data/hashes/lol" convert -i "bins" -o "temp" -t json -r

start /b /wait ruby stringtable.rb
start /b /wait ruby alpha.rb
start /b /wait ruby cleanup.rb
start /b /wait ruby keyword.rb
pause