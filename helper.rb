str = "Aim for the Head
Energetic
Hive Mind
Hybrid
Multitool
Panic Room
Quest: Rite of the Forge God
Righteous Fury
Unshackled"

arr = str.split("\n").map { |s| "**#{s}**\n\n\n" }
puts arr