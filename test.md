**Just a reminder that PBE changes are not final and subject to change. Some changes, such as bugfixes, may not be able to be viewed. I'm also human. I make mistakes from time to time.**

## Summoner's Rift

### Champions

**Cassiopeia**

* P Bonus Move Speed Multiplier: 6-40% -> 5-35.6%
* Q Mana Cost: 50/55/60/65/70 -> 40/40/45/50/55
  * Likely intended to be 40-60. Duplicate entry placed at wrong end of array.
* E AP Ratio: 10% -> 20%
* E Empowered AP Ratio: 55% -> 45%
* E Mana Cost: 40 -> 45
* R AP Ratio: 50% -> 75%

**Ekko**

* Q Return Damage: 40/65/90/115/140 -> 40/70/100/130/160
* Q Mana Cost: 50/60/70/80/90 -> 30/40/50/60/70

**Syndra**

* Base HP: 584 -> 570

**Zaahen**

* Q2 Base Damage: 25/50/75/100/125 -> 30/60/90/120/150

## League Classic

### Champions

**More general un-hardcoding champion data. For the new champs (Fiora/Galio/Jarvan/Poppy/Shyvana/Xin Zhao) I will only be documenting changes *after* their first apperance on PBE.**

**Akali**

* Can no longer move while casting W
* Q + R Visual Cast Range modified to better reflect functionality.
  * Q Visual Range: 550 units -> 575 units
  * R Visual Range: 675 units -> 775 units

**Anivia**

* Q Missile Speed: 950 -> 850

**Malzahar**

* Attack Speed Growth: 1.36 -> 3.0
* Attack Speed Ratio: 0.625 -> 0.658
* Q AP Ratio: 80% -> 70%
* Voidling Move Speed: 400 -> 460
* Voidling Gold Yield: 2 -> 12
* Voidling Auto Attack Cast Frame: 12 -> 9

**Nasus**

* Q Damage rescripted to work properly with Crit Damage.

**Shyvana**

* Human Q AD Ratio: 100% AD -> 80/85/90/95/100% AD
* W Max Duration Extension: 3 seconds -> 4 seconds
* Human E Range: 950 units -> 925 units
* Human E Missile Speed: 1700 -> 1200
* Dragon E Missile Width: 60 units -> 20 units
* Dragon E Missile Speed: 1700 -> 2000
* R Minimum Cast Range: 500 units -> 100 units

**Warwick**

* Base Attack Speed + Ratio: 0.644 -> 0.625
* P Damage Calculation changed from Interpolation to Linear. Start and end values unchanged.
  * 3-16 -> 3 (+0.5 per level until level 9, then +1 per level)
* W Cooldown: 24/22/2/18/16 seconds -> 30/27/24/21/18 seconds
* R Base Damage: 250/335/420 -> 180/300/420
* R now has a Visual Cast Range of 625 to better reflect functionality.

**Xin Zhao**

* Base AD: 55 -> 55.3
* Base HP5: 8 -> 7.7
* E Mana Cost: 50 -> 60

### Systems

**Minions**

* All minions had their time scaling values modified at a script level. I will not be comparing the details here as Phreak likely has a video in the works explaining it better than I could try guessing at its function anyway.

## ARAM: Mayhem

### Augments

**Clown College**

* Returning as a Prismatic augment. Values are unchanged from previous iteration.
* Unknown what the On-Death explosion is supposed to be. Augment description is still marked as true damage but expanded tooltip notes magic damage.

**High Roller**

* Anvil Spawn Chance (as far as I can tell): 1.5% for all unit types -> 1% for all unit types, 0.5% for all summons (Malz W, Illaoi E, Heimer Q, etc)

**Spin to Win**

* Damage Amplifier is now 50% for all Ultimate Abilities.

### Augment Pools

**Jeweled Gauntlet Pooling**

* Four generic AD groupings had Jeweled Gauntlet removed. They appear to want this augment reserved for Crit-based/Hybrid AD champions only rather than the majority of the cast.

**"Crowd Control" Augments**

* Squishy Slappy Grab has been removed from this group.
  * Group still contains Terror and Fey Magic, so not sure what the case is here.

**"Stacking" Augments**

* Phenominal Evil, Tank Engine, and Bursting Teeth have been removed from this group.

**Health Augments**

* Augments: Celestial Body, Dawnbringer's Resolve, Dropkick, Final Form, Goliath, Heavy Hitter, Mad Scientist, Mind to Matter, Nature is Healing, Perseverance, Pressure Cooker, Void Immolation, Steel Your Heart, Urf's Champion, Squishy Slappy Grab, Tank Engine
* Anivia, Aurelion Sol, Cassiopeia, Lillia, and Nidalee had Health augments removed from their pools.
  * Note: This only removes one entry with their listed weight (see below), and does not prevent the champion from receiving the augment if another pool has it.
* Morgana had Health augments lowered in frequency, roughly 4.7% -> 3.2%.
* Ryze had Health augments lowered in frequency, roughly 5.6% -> 3.8%
  * Note: See prior note. This is *strictly* an approximation and not reflective of the whole picture. See note at the end of the post.

**Technically I've been able to check this since the last Mayram "Act" started, but it was very unreadable and I really didn't feel like it. Last patch had it reworked again and it's far easier to parse.**

**Please check out [this Paste](https://pastebin.com/Uc6xUUqX) to view the list of Augment groupings and [this Paste](https://pastebin.com/JGVyE1PT) to view the tags each Champion gets. Please note that not all groupings have accurate names to how Riot intends to group them, many labels are my own interpretation of the groupings, hence the quotes in this post.**

**NOTE: I am working on a tool to have augment weightings be easily viewable and searchable. Take any data you see here with a grain of salt, as Riot has not made the full pooling system public information. These values will not be 100% accurate to what happens in game, but serve to provide a decent baseline. Current data also contains disabled/removed augments.**