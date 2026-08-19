require 'json'
require 'fileutils'
require 'hashie'
require 'digest/xxhash'

$manualHash = {}

txt = ""
File.open("lang/manualhash.txt", 'rb') { |f| txt = f.read }
txt.split("\n").each { |f|
    obf, name = f.split(" ")
    $manualHash.store(obf, name)
}
$manualHash.merge!({
    "e1136d1" => "CastRange",
    "a0eddc9" => "SpellAttributeModifiable",
    "210f9ec0" => "primaryResourceCost",
    "a3e0478" => "Default",
    "630af303" => "ResourceCostModifiable",
    "787ccb97" => "Perk_Health",
    "150d1b92" => "BotNonsense",
    "b09016f6" => "BotCalculation",
    "ee39916f" => "VFXEmissionOffset",
    "32559c50" => "TooltipFormatA",
    "6b06978" => "QuestIconPath",
    "7a1cab0d" => "TexturePath",
    "898bb7cb" => "MilestoneData",
    "c88f1a9b" => "QuestTooltipTra",
    "8d31b69b" => "QuestData",
    "3ed971bd" => "LinkedQuest",
    "e93de85a" => "LinkedQuestData",
    "b35aa769" => "BaseValue", 
    "1262a25" => "mrPerLevel", 
    "18956a21" => "armorPerLevel",
    "4af40dc3" => "baseDamage",
    "4d37af28" => "hpPerLevel",
    "836cc82a" => "attackSpeed",
    "7bd4b298" => "attackRange",
    "4f89c991" => "attackSpeedRatio",
    "8662cf12" => "baseHP",
    "913157bb" => "hpRegenPerLevel",
    "9eedebad" => "baseStaticHPRegen",
    "b9f2b365" => "attackSpeedPerLevel",
    "e2b5d80d" => "damagePerLevel",
    "e62d9d92" => "baseMoveSpeed",
    "ea6100d5" => "baseArmor",
    "726ee5cd" => "arBase",
    "c4ab3550" => "arBaseStaticRegen",
    "6216bf7b" => "arPerLevel",
    "3a509002" => "arRegenPerLevel",
    "2290fc9a" => "baseFactorHPRegen",
    "452033bb" => "arBaseFactorRegen",
    "988fea51" => "AugmentSets",
    "9bfe08c0" => "AugmentList",
    "6387172" => "RangedIntegerIndicatorTT",
    "792cf56b" => "MeleeIntegerIndicatorTT",
    "e9a3c91d" => "RangedModifiableGameCalculation",
    "5d09db83" => "HomeguardRangeModified",
    "84eb6ffe" => "ModifiedAttackDamageTT",
    "3fb72b56" => "ModifiedMaxHealthTT",
    "b709bd5f" => "StartingStacksIfSecondAugment",
    "f3cbe7b2" => "NamedGameCalculationCalculationPart",
    "95ab772f" => "InfiniteRecursionStackCount",
    "b75add86" => "CritToHasteConversionTT",
    "19ad35ce" => "StupidTibbersCalc1",
    "3e5305d0" => "StupidTibbersCalc2",
    "2cf8f9f" => "IDKSomeUnusedVersionOfTitansPulse",
    "e5d3c722" => "BonusHealingPercent_Dummy",
    "ee18a47b" => "NamedDataValuesByCharLevelInterpolationCalculationPart",
    "589a59c" => "mDataValueStart",
    "b65bc23" => "mDataValueEnd",
    "ddb49807" => "SomeToothFairyCalc",
    "8bda434b" => "InnerRadiusDamageTT",
    "72c5c2a8" => "SomeFlagBroIDK",
    "a242b94" => "BleedDamageHealthCalc",
    "7530a709" => "HellbentIDCDMaybe",
    "9458241" => "MaxHealthDamageFloat",
    "6496b454" => "LifeStealMeleeTTMaybe",
    "86966509" => "Calc_Radius_Maybe",
    "78b55a21" => "Calc_Shield_Modified",
    "76180b74" => "Augment_BurstingTeeth_Counter",
    "2b25a73a" => "AbilityResourceByNamedDataValueCalculationPart",
    "14cf4ae0" => "Augment_SoulEater_Counter",
    "89615869" => "Calc_Damage_Crit",
    "515f1819" => "Augment_PoroCharge_FedPorosCount_QuestCompleted",
    "866a6106" => "Augment_ARAM_EndlessHunt_Count",
    "e152c035" => "Calc_Ult_Damage_Amp",
    "af6ecc4c" => "ArenaTeamSize",
    "4120d321" => "Electrocute_Damage",
    "a4e17dad" => "TotalShieldInternal",
    "7c50d74e" => "TrueDamageCalculationInternal",
    "b22609db" => "NamedDataValueByCharLevelCalculationPart",
    "91d404a5" => "baseDamage",
    "b2cd0eb0" => "bonusPerLevel",
    "85d7d7f0" => "TicksBeforeDeathOver4",
    "ac16d3ed" => "ShieldCapCalc",
    "3ea68b4" => "BigOneDamage",
    "cd5eb5cd" => "ModifiedHPCalc",
    "d404872c" => "DelayedHitDamage",
    "7e05f704" => "LevelableAugmentCounter",
    "d52ab278" => "HealthRestoredAmount",
    "e0c8aaa6" => "HealthSacrificedCounter",
    "f8185082" => "RedShardCounter",
    "bd1c8a39" => "BlueShardCounter",
    "c8b89cf7" => "GreenShardCounter",
    "6e93dac5" => "AugmentGroupEntry",
    "fead7e9b" => "AugmentGroups",
    "f9e46502" => "ChampionAugmentList",
    "248cf7db" => "AugmentList",
    "3572d78a" => "WeightedAugmentList",
    "f1500c60" => "CharacterWeightedAugmentList",
    "c940fe53" => "AugmentGroup",
    "6ab26981" => "EmptyAugmentPool1",
    "4974e2dd" => "EmptyAugmentPool2",
    "b890af78" => "EmptyAugmentPool3",
    "e2e949d1" => "JadeAugments",
    "4ec15a0a" => "LinkedAugmentGroups",
    "eb2338a" => "REMOVED_AUGMENT",

    
    "51f91098" => "Burn", # exacts

    "b945e5f7" => "GoldGrantingAugments",
    "8aa4910b" => "AutocastAugments",
    "794c79e3" => "AutocastAugmentsARAM",
    "a1d5fd67" => "AutocastAugmentsPeel",
    "5d5c7e03" => "SizeModifiers",
    "b75763f2" => "OnHitAugments",
    "cb218786" => "GeneralAugments",
    "56299123" => "CCAugments",
    "257a6f57" => "CCSourceAugments",
    "9f7a920a" => "AutocastAugmentsRange",
    "73f04b68" => "RequiresUltimateAugments",
    "47e861e5" => "FighterAugments",
    "ad208342" => "ShieldAugmentsGeneral",
    "4237aeb9" => "ScalarAugmentsAP",
    "10f8e38e" => "ScalarAugmentsTank",
    "f7c80e19" => "DashAugments",
    "c942e497" => "SelfHealingAugments",
    "5637ce35" => "SomeKindOfADAugments",
    "d1747a88" => "SupportAugmentsHealing",
    "4f40633b" => "MovementAugmentsDefensive",
    "b5972caa" => "HealthGrantingAugments",
    "5c690cf3" => "MageAugmentsGeneric",
    "995ac030" => "CasterAugmentsGeneric",
    "8c232386" => "OnTakedownAugments",
    "70692c6f" => "ADCaster",
    "2b5a8648" => "OnDeathAugments",
    "7b6873c7" => "MageAugmentsGeneric3",
    "2fe0f044" => "ADCAugments",
    "59a0acc7" => "MageAugmentsGeneric4",
    "dfbc5fd2" => "FallbackGoldAugmentsMaybe",
    "3be10328" => "HybridAugments",
    "8ae6ed2e" => "MovementAugments",
    "13ce30b4" => "MageAugmentsGeneric5",
    "2fc101c6" => "FighterAugments2",
    "b66c16c2" => "MageAugmentsBattlemage",
    "563cdf9c" => "AbilityAugments1",
    "99d70c96" => "StackingAugments",
    "ba7415bd" => "HasteAugments",
    "ddc42af3" => "SupportAugmentsHealing2",
    "9579774e" => "ItemAugments",
    "a26bf746" => "AbilityAugments2",
    "b5056d3d" => "ADCAugments2",
    "ba0256ad" => "TankAugments",
    "86d9be15" => "HSPower",

    "14409aa2" => "AugmentGroups/MR",
    "15409c35" => "AugmentGroups/MS",
    "16fd2e88" => "AugmentGroups/Armor",
    "191d0093" => "AugmentGroups/GoldGrantingAugments",
    "1a253eaf" => "AugmentGroups/AutocastAugments",
    "223fc38" => "AugmentGroups/AH",
    "233e5daf" => "AugmentGroups/AutocastAugmentsARAM",
    "25f2135b" => "AugmentGroups/ArmorPen",
    "2a69fbdc" => "AugmentGroups/Omnivamp",
    "31169cbb" => "AugmentGroups/AutocastAugmentsPeel",
    "3c1d0047" => "AugmentGroups/SizeModifiers",
    "3e3439f6" => "AugmentGroups/OnHitAugments",
    "3ec90ced" => "AugmentGroups/EmptyAugmentPool1",
    "40cddb7a" => "AugmentGroups/GeneralAugments",
    "4324795d" => "AugmentGroups/CritChance",
    "4a6ad9db" => "AugmentGroups/CCSourceAugments",
    "5287e1f" => "AugmentGroups/CCAugments",
    "55cc5e63" => "AugmentGroups/MagicPen",
    "5637e17b" => "AugmentGroups/Peel",
    "587efdc6" => "AugmentGroups/AutocastAugmentsRange",
    "58b41414" => "AugmentGroups/RequiresUltimateAugments",
    "5c43f819" => "AugmentGroups/FighterAugments",
    "646d34c6" => "AugmentGroups/ShieldAugmentsGeneral",
    "6555437d" => "AugmentGroups/ScalarAugmentsAP",
    "65f23f6a" => "AugmentGroups/ScalarAugmentsTank",
    "6b8974b5" => "AugmentGroups/DashAugments",
    "705406d3" => "AugmentGroups/SelfHealingAugments",
    "71555661" => "AugmentGroups/SomeKindOfADAugments",
    "73c4ca81" => "AugmentGroups/HSPower",
    "73cbb964" => "AugmentGroups/Burn",
    "752596bc" => "AugmentGroups/SupportAugmentsHealing",
    "76b0ea66" => "AugmentGroups/mana",
    "76b77039" => "AugmentGroups/EmptyAugmentPool2",
    "76d4b52f" => "AugmentGroups/MovementAugmentsDefensive",
    "78adf47d" => "AugmentGroups/JadeAugments",
    "78e3793e" => "AugmentGroups/HealthGrantingAugments",
    "841e719f" => "AugmentGroups/MageAugmentsGeneric",
    "8ad08224" => "AugmentGroups/CasterAugmentsGeneric",
    "8d576bba" => "AugmentGroups/OnTakedownAugments",
    "901e8483" => "AugmentGroups/ADCaster",
    "98205824" => "AugmentGroups/OnDeathAugments",
    "a2408d0" => "AugmentGroups/AP",
    "a2c9d49b" => "AugmentGroups/MageAugmentsGeneric3",
    "a6f488c0" => "AugmentGroups/ADCAugments",
    "aecc7573" => "AugmentGroups/MageAugmentsGeneric4",
    "b040a516" => "AugmentGroups/FallbackGoldAugmentsMaybe",
    "baf4a83c" => "AugmentGroups/HybridAugments",
    "c2918c72" => "AugmentGroups/MovementAugments",
    "c69f6f24" => "AugmentGroups/EmptyAugmentPool3",
    "d240d89" => "AugmentGroups/AS",
    "d2809836" => "AugmentGroups/LifeSteal",
    "dabcc810" => "AugmentGroups/MageAugmentsGeneric5",
    "df350452" => "AugmentGroups/FighterAugments2",
    "e139ccde" => "AugmentGroups/MageAugmentsBattlemage",
    "e4414998" => "AugmentGroups/AbilityAugments1",
    "e5c7ec2a" => "AugmentGroups/StackingAugments",
    "e67f4793" => "AugmentGroups/Health",
    "e91cf039" => "AugmentGroups/HasteAugments",
    "e9b8675d" => "AugmentGroups/Spellvamp",
    "ec237687" => "AugmentGroups/SnowBall",
    "f1838e7f" => "AugmentGroups/SupportAugmentsHealing2",
    "f4f980ba" => "AugmentGroups/ItemAugments",
    "f539ec5a" => "AugmentGroups/AbilityAugments2",
    "f6bc67f9" => "AugmentGroups/ADCAugments2",
    "fdd60739" => "AugmentGroups/TankAugments",
    "fe23f5ec" => "AugmentGroups/AD",

    "20ae8504" => "ChampionAugmentList/Aatrox",
    "a0beeca3" => "ChampionAugmentList/Ahri",
    "78813b69" => "ChampionAugmentList/Akali",
    "68266b2b" => "ChampionAugmentList/Akshan",
    "5070c4b1" => "ChampionAugmentList/Alistar",
    "ac4155a2" => "ChampionAugmentList/Amumu",
    "8de543d9" => "ChampionAugmentList/Anivia",
    "66a804c" => "ChampionAugmentList/Annie",
    "9e181584" => "ChampionAugmentList/Aphelios",
    "f9b264d0" => "ChampionAugmentList/Ashe",
    "d035f954" => "ChampionAugmentList/AurelionSol",
    "554a50db" => "ChampionAugmentList/Aurora",
    "ea8b8fdf" => "ChampionAugmentList/Azir",
    "1dc61688" => "ChampionAugmentList/Bard",
    "975964f7" => "ChampionAugmentList/Belveth",
    "5f7c02bd" => "ChampionAugmentList/Blitzcrank",
    "38e98754" => "ChampionAugmentList/Brand",
    "1205206c" => "ChampionAugmentList/Braum",
    "981bf3cd" => "ChampionAugmentList/Briar",
    "723a8629" => "ChampionAugmentList/Caitlyn",
    "a95d5714" => "ChampionAugmentList/Camille",
    "2c8ac614" => "ChampionAugmentList/Cassiopeia",
    "104eee71" => "ChampionAugmentList/Chogath",
    "a1348321" => "ChampionAugmentList/Corki",
    "931ccaf5" => "ChampionAugmentList/Darius",
    "19a82616" => "ChampionAugmentList/Diana",
    "a58cbb86" => "ChampionAugmentList/DrMundo",
    "dce1438d" => "ChampionAugmentList/Draven",
    "3ce682dd" => "ChampionAugmentList/Ekko",
    "44069e01" => "ChampionAugmentList/Elise",
    "cc17bd70" => "ChampionAugmentList/Evelynn",
    "711645f4" => "ChampionAugmentList/Ezreal",
    "66e71384" => "ChampionAugmentList/FiddleSticks",
    "636c09aa" => "ChampionAugmentList/Fiora",
    "f85f2306" => "ChampionAugmentList/Fizz",
    "cebf1ea5" => "ChampionAugmentList/Galio",
    "1d802754" => "ChampionAugmentList/Gangplank",
    "2d66b4f0" => "ChampionAugmentList/Garen",
    "bd782c5" => "ChampionAugmentList/Gnar",
    "ea42bc5e" => "ChampionAugmentList/Gragas",
    "794d62c9" => "ChampionAugmentList/Graves",
    "238ccd56" => "ChampionAugmentList/Gwen",
    "151c0be4" => "ChampionAugmentList/Hecarim",
    "bcff8472" => "ChampionAugmentList/Heimerdinger",
    "e5a8f04" => "ChampionAugmentList/Hwei",
    "dab2b15d" => "ChampionAugmentList/Illaoi",
    "dab5d6e7" => "ChampionAugmentList/Irelia",
    "88f6dea3" => "ChampionAugmentList/Ivern",
    "9545de11" => "ChampionAugmentList/Janna",
    "5319acfa" => "ChampionAugmentList/JarvanIV",
    "f9008ba2" => "ChampionAugmentList/Jax",
    "51406505" => "ChampionAugmentList/Jayce",
    "cd63752a" => "ChampionAugmentList/Jhin",
    "6b363070" => "ChampionAugmentList/Jinx",
    "c70b006d" => "ChampionAugmentList/KSante",
    "7ef947aa" => "ChampionAugmentList/Kaisa",
    "75147f96" => "ChampionAugmentList/Kalista",
    "315cdb99" => "ChampionAugmentList/Karma",
    "1015a207" => "ChampionAugmentList/Karthus",
    "f2493263" => "ChampionAugmentList/Kassadin",
    "b79f7104" => "ChampionAugmentList/Katarina",
    "4b250571" => "ChampionAugmentList/Kayle",
    "8b84be8" => "ChampionAugmentList/Kayn",
    "8baa9e70" => "ChampionAugmentList/Kennen",
    "12375efa" => "ChampionAugmentList/Khazix",
    "646ed2c8" => "ChampionAugmentList/Kindred",
    "d37f6c3d" => "ChampionAugmentList/Kled",
    "46411205" => "ChampionAugmentList/KogMaw",
    "20e7cd13" => "ChampionAugmentList/LeeSin",
    "a7ec4f00" => "ChampionAugmentList/Leona",
    "91309022" => "ChampionAugmentList/Lillia",
    "9b178b9e" => "ChampionAugmentList/Lissandra",
    "8e7a5abf" => "ChampionAugmentList/Lucian",
    "5736d61b" => "ChampionAugmentList/Lulu",
    "7a86e110" => "ChampionAugmentList/Lux",
    "8b41c21d" => "ChampionAugmentList/Malphite",
    "802be32d" => "ChampionAugmentList/Malzahar",
    "1db7286d" => "ChampionAugmentList/Maokai",
    "209db6a3" => "ChampionAugmentList/MasterYi",
    "ee680ef7" => "ChampionAugmentList/Milio",
    "35410c5c" => "ChampionAugmentList/MissFortune",
    "7bb43265" => "ChampionAugmentList/MonkeyKing",
    "b96d0ffb" => "ChampionAugmentList/Mordekaiser",
    "ad8845b2" => "ChampionAugmentList/Morgana",
    "2291d9" => "ChampionAugmentList/Naafiri",
    "ede4c18c" => "ChampionAugmentList/Nami",
    "a1cbdc93" => "ChampionAugmentList/Nasus",
    "b92bd9fe" => "ChampionAugmentList/Nautilus",
    "3dc0b59b" => "ChampionAugmentList/Neeko",
    "567794b9" => "ChampionAugmentList/Nidalee",
    "b85add13" => "ChampionAugmentList/Nilah",
    "41a95b1" => "ChampionAugmentList/Nocturne",
    "1d3914c7" => "ChampionAugmentList/Nunu",
    "9605f9d7" => "ChampionAugmentList/Olaf",
    "5f6cacf7" => "ChampionAugmentList/Orianna",
    "345184e" => "ChampionAugmentList/Ornn",
    "c897515c" => "ChampionAugmentList/Pantheon",
    "fb857751" => "ChampionAugmentList/Poppy",
    "e321a9dc" => "ChampionAugmentList/Pyke",
    "7c0aa6ae" => "ChampionAugmentList/Qiyana",
    "550c80ec" => "ChampionAugmentList/Quinn",
    "ef472274" => "ChampionAugmentList/Rakan",
    "8cc6add0" => "ChampionAugmentList/Rammus",
    "c6da5606" => "ChampionAugmentList/RekSai",
    "7cb4d392" => "ChampionAugmentList/Rell",
    "79c43870" => "ChampionAugmentList/Renata",
    "83a7b05d" => "ChampionAugmentList/Renekton",
    "a1c5048e" => "ChampionAugmentList/Rengar",
    "d0fd31fb" => "ChampionAugmentList/Riven",
    "76940612" => "ChampionAugmentList/Rumble",
    "6685788b" => "ChampionAugmentList/Ryze",
    "26c7f240" => "ChampionAugmentList/Samira",
    "775e00e0" => "ChampionAugmentList/Sejuani",
    "3738d222" => "ChampionAugmentList/Senna",
    "5cda50a0" => "ChampionAugmentList/Seraphine",
    "a3e141df" => "ChampionAugmentList/Sett",
    "370696a5" => "ChampionAugmentList/Shaco",
    "e3975fcb" => "ChampionAugmentList/Shen",
    "83996f47" => "ChampionAugmentList/Shyvana",
    "18e9c029" => "ChampionAugmentList/Singed",
    "4dc0df86" => "ChampionAugmentList/Sion",
    "5f00128" => "ChampionAugmentList/Sivir",
    "8838758f" => "ChampionAugmentList/Skarner",
    "b66b566f" => "ChampionAugmentList/Smolder",
    "dec04c78" => "ChampionAugmentList/Sona",
    "f1eb4f64" => "ChampionAugmentList/Soraka",
    "bdcdcb3" => "ChampionAugmentList/Swain",
    "23469fd" => "ChampionAugmentList/Sylas",
    "8c5d9a28" => "ChampionAugmentList/Syndra",
    "9696de40" => "ChampionAugmentList/TahmKench",
    "7336347" => "ChampionAugmentList/Taliyah",
    "b8d9a3c9" => "ChampionAugmentList/Talon",
    "5e0d989e" => "ChampionAugmentList/Taric",
    "96dc647b" => "ChampionAugmentList/Teemo",
    "c686f07d" => "ChampionAugmentList/Thresh",
    "e8d0bc5b" => "ChampionAugmentList/Tristana",
    "59c2cb95" => "ChampionAugmentList/Trundle",
    "c1e8ea26" => "ChampionAugmentList/Tryndamere",
    "e96cee55" => "ChampionAugmentList/TwistedFate",
    "2a67adc0" => "ChampionAugmentList/Twitch",
    "cae35ae9" => "ChampionAugmentList/Udyr",
    "950dc35e" => "ChampionAugmentList/Urgot",
    "7c776e2c" => "ChampionAugmentList/Varus",
    "656e1bf0" => "ChampionAugmentList/Vayne",
    "71ecd2b5" => "ChampionAugmentList/Veigar",
    "d5058176" => "ChampionAugmentList/Velkoz",
    "76f0a022" => "ChampionAugmentList/Vex",
    "88f1f6a2" => "ChampionAugmentList/Vi",
    "67e450cb" => "ChampionAugmentList/Viego",
    "a9626c05" => "ChampionAugmentList/Vladimir",
    "a627afbd" => "ChampionAugmentList/Volibear",
    "bc413751" => "ChampionAugmentList/Warwick",
    "1ec774e2" => "ChampionAugmentList/Xayah",
    "12d15e95" => "ChampionAugmentList/Xerath",
    "2a10d676" => "ChampionAugmentList/Yasuo",
    "1a62dd16" => "ChampionAugmentList/Yone",
    "59f23804" => "ChampionAugmentList/Yorick",
    "db6e6cae" => "ChampionAugmentList/Yuumi",
    "42351147" => "ChampionAugmentList/Zac",
    "1f3dd48a" => "ChampionAugmentList/Zed",
    "d6e1ff3" => "ChampionAugmentList/Zeri",
    "9ae30bdd" => "ChampionAugmentList/Ziggs",
    "1937a2a" => "ChampionAugmentList/Zilean",
    "1c25caeb" => "ChampionAugmentList/Zoe",
    "d1f7aa97" => "ChampionAugmentList/Zyra",
    "e750e819" => "ChampionAugmentList/Ambessa",
    "3d71bd9c" => "ChampionAugmentList/Viktor",
    "4302ed3" => "ChampionAugmentList/Mel",
    "1e265736" => "ChampionAugmentList/Leblanc",
    "d2e32e84" => "ChampionAugmentList/XinZhao",
    "a3c6999" => "ChampionAugmentList/Yunara",
    "9eae62e0" => "ChampionAugmentList/Zaahen",
    "464a407b" => "ChampionAugmentList/Locke",
})

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
                key = key[1...key.length - 1]
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

def badString?(key, value) 
    badKeys = [
        "GeneratedTip",
        "TFT",
        #"Cherry",
        #"Kiwi",
        #"Ruby",
        #"Strawberry",
        #"Brawl",
        #"Crepe",
        #"Slime",
        #"Awesome",
        "aprilfools",
        "ultbook",
        "companion"
    ]

    badValues = [
        #going to assume that no normal English words will contain this
        #a string containing a {{GeneratedTip_XXX}} reference is not guaranteed to be invalid however
        "TFT",
        #"Cherry",
        #"Kiwi",
        #"Ruby",
        #"Strawberry",
        #"Crepe",
        "aprilfools",
        "ultbook",
    ]

    return true if badKeys.any? { |str| key.include?(str.downcase) }
    return true if badValues.any? { |str| value.include?(str.downcase) }
    return false
end

def diff
    print "Loading previous patch stringtable..."
    oldLang = {}
    File.open("lol.stringtable.json", 'rb') { |f| oldLang = JSON.parse(f.read()) }
    oldLang = oldLang["entries"] || oldLang
    hash = {}
    oldLang.transform_keys! { |k|
        if k.start_with?("{")
            ret = k[1..k.length - 1].to_i(16).to_s(16)
        else
            ret = xxh3(k.downcase)
        end
        hash.store(ret, k)
        ret
    }
    print "done.\n"

    print "Finding file diffs..."
    newStrings = {}
    removedStrings = {}
    changedStrings = {}

    oldLang.each { |key, tl|
        next if tl.empty?
        next if badString?(hash.fetch(key, key), tl)
        newTl = $lang[key]

        if newTl.nil?
            removedStrings.store(key, tl)
        else
            changedStrings.store(key, [tl, newTl]) if tl != newTl
        end
    }

    $lang.each { |key, newTl|
        next if newTl.empty?
        next if badString?(hash.fetch(key, key), newTl)
        tl = oldLang[key]
        if tl.nil?
            newStrings.store(key, newTl)
        end
    }
    
    output = ""
    champDiff = {}
    champExceptions = [
        "anticheat", "dynamic", "behavior", "statanvil", "phenomenalevil", "augment"
    ]
    removedStrings.each { |key, tl|
        champion = nil
        $champLang.each { |c| 
            if hash.fetch(key, key).include?(c)
                champion = c unless champExceptions.any? { |ce| hash.fetch(key, key).include?(ce) }
                break
            end
        }

        s = hash.fetch(key, key)
        s = "{#{"%010x" % s.to_i(16)}}" if s.to_i(16).to_s(16) == s
        str = "REMOVED:\n#{s.inspect} = #{tl.inspect}\n"
        if champion
            champDiff[champion] ||= []
            champDiff[champion].push(str)
        else
            output += str
        end
    }
    newStrings.each { |key, tl|
        champion = nil
        $champLang.each { |c| 
            if hash.fetch(key, key).include?(c)
                champion = c unless champExceptions.any? { |ce| hash.fetch(key, key).include?(ce) }
                break
            end
        }

        s = hash.fetch(key, key)
        s = "{#{"%010x" % s.to_i(16)}}" if s.to_i(16).to_s(16) == s
        str = "ADDED:\n#{s.inspect} = #{tl.inspect}\n"
        if champion
            champDiff[champion] ||= []
            champDiff[champion].push(str)
        else
            output += str
        end
    }
    changedStrings.each { |key, tl|
        champion = nil
        $champLang.each { |c| 
            if hash.fetch(key, key).include?(c)
                champion = c unless champExceptions.any? { |ce| hash.fetch(key, key).include?(ce) }
                break
            end
        }
        
        oldStr, newStr = tl

        firstDiff = -1
        i = 0
        while i < oldStr.length && i < newStr.length
            if oldStr[i] != newStr[i]
                firstDiff = i
                break
            end
            i += 1
        end

        oldLastDiff = 0
        newLastDiff = 0
        if firstDiff < 0
            # append/removal. strings were equal until one ended
            firstDiff = oldStr.length < newStr.length ? oldStr.length : newStr.length
            oldLastDiff = firstDiff
            newLastDiff = firstDiff
        else
            i = oldStr.length - 1
            j = newStr.length - 1
            while i >= firstDiff && j >= firstDiff
                if oldStr[i] != newStr[j]
                    oldLastDiff = i
                    newLastDiff = j
                    break
                end
                if i == firstDiff || j == firstDiff
                    oldLastDiff = i - 1
                    newLastDiff = j - 1
                    break
                end
                i -= 1
                j -= 1
            end
        end
        
        prefix = oldStr[0, firstDiff]
        oldInfix = oldStr[firstDiff, oldLastDiff - firstDiff + 1]
        newInfix = newStr[firstDiff, newLastDiff - firstDiff + 1]
        suffix = oldStr[oldLastDiff + 1...]
        next if suffix.nil?
        s = hash.fetch(key, key)
        s = "{#{"%010x" % s.to_i(16)}}" if s.to_i(16).to_s(16) == s
        str = "CHANGED:\n#{s.inspect} =\n#{prefix.inspect}...\n  ...#{oldInfix.inspect}...\n  -->\n  ...#{newInfix.inspect}...\n#{suffix.inspect}\n"
        if champion
            champDiff[champion] ||= []
            champDiff[champion].push(str)
        else
            output += str
        end
    }

    output2 = ""
    champDiff.each { |champ, changes|
        output2 += "#{champ}:\n"
        changes.each { |change|
            output2 += change
        }
        output2 += "\n"
    }

    File.open("filediffs/lang.txt", 'wb') { |f| f.write(output) }
    File.open("filediffs/champs.txt", 'wb') { |f| f.write(output2) }
    print "done.\n"
end

def augmentSearcher(key, data, version=0)
    if data["~class"]&.eql?("AugmentData")
        source = $arena
        source = $aramMayhem if version == 1
        source = version if version.is_a?(Hash)
        aug = {
            "id" => data.fetch("AugmentPlatformId", -1),
            "apiName" => data.fetch("AugmentNameId", ""),
            "name" => data.fetch("NameTra", ""),
            "rarity" => ["Silver", "Gold", "Prismatic"][data.fetch("rarity", 0).to_i.clamp(0, 2)],
            "disabled" => data.dig("Enabled") == false,
            "desc" => data.fetch("DescriptionTra", ""),
            "maxLevelTooltip" => {},
            "maxLevelSummary" => {},
            "tooltip" => data.fetch("AugmentTooltipTra", ""),
            "dataValues" => {},
            "calculations" => {},
            "add" => {},
            "quest" => data.fetch("0x3ed971bd", ""),
            "icons" => [
                data.fetch("AugmentSmallIconPath", ""),
                data.fetch("AugmentLargeIconPath", "")            
            ]
        }

        

        linkedObjects = data.fetch("AdditionalSpells", [])

        spellName = data.dig("RootSpell")
        if spellName
            spellObject = source.dig(spellName)
            if spellObject
                mSpell = spellObject.fetch("mSpell", {})
                dataValues = mSpell.fetch("DataValues", [])
                modes = mSpell.dig("DataValuesModeOverride")
                if modes && version.is_a?(Hash)
                    o = modes["cherry"]["SpellDataValues"]
                    overrides = {}
                    o.each { |f| 
                        overrides.store(f["name"], f["values"])
                    }
                end

                dataValues.each { |component|
                    name = component["name"]
                    name = $lang.fetch(name, name)
                    values = component["values"] || []
                    if overrides
                        values = overrides[name] || values
                    end
                    puts "#{spellName} ::: #{name}" if !values
                    values = values[0] if values.uniq.length == 1
                    aug["dataValues"].store(name, values)
                }

                calcs = mSpell.fetch("mSpellCalculations", {})
                aug["calculations"] = applyLangKeys(applyLang(calcs))
                
            end
        end
        linkedObjects.each { |obj|
            next if obj == spellName
            spellObject = source.dig(obj)
            if spellObject && spellObject["~class"] == "SpellObject" && spellObject.key?("mSpell")
                mSpell = spellObject.fetch("mSpell", {})
                dataValues = mSpell.fetch("DataValues", [])
                str = spellObject.fetch("ObjectName", obj)
                aug["add"][str] = { "dataValues" => {}, "calcs" => {} }
                
                dataValues.each { |component|
                    name = component["name"]
                    name = $lang.fetch(name, name)
                    values = component["values"] || []
                    puts "#{spellName} ::: #{name}" if !values
                    values = values[0] if values.uniq.length == 1
                    aug["add"][str]["dataValues"].store(name, values)
                }

                calcs = mSpell.fetch("mSpellCalculations", {})
                aug["add"][str]["calcs"] = applyLangKeys(applyLang(calcs))
                
            end
        }

        maxAugmentData = data.dig("0x791eb92e")&.dig("0x5753a320")
        if maxAugmentData
            aug["maxLevelTooltip"] = maxAugmentData.fetch("0x5835d27", {})
            aug["maxLevelSummary"] = maxAugmentData.fetch("0xc98a82ca", {})
        end


        aug["add"]&.delete_if { |augKey, augValue| ["dataValues", "calculations"].any? { |a| augValue[a]&.empty? }}
        aug.delete_if { |augKey, augValue|
            (augKey == "disabled" && augValue == false) ||
            (["dataValues", "calculations", "add", "maxLevelTooltip", "maxLevelSummary"].any? { |a| augKey == a } && augValue.empty?)
        }
        aug = applyLangKeys(applyLang(aug))
        aug.delete("maxLevelSummary") if aug["maxLevelSummary"]&.strip == aug["maxLevelTooltip"]&.strip
        (aug.delete("maxLevelTooltip"); aug.delete("maxLevelSummary")) if version == 1
        aug.delete("quest") if aug["quest"] == ""
        (aug.delete("quest")) if version == 0
        return assetNameFix(aug)
    end
    return nil
end

def buildAugmentQuest(augment, questData)
    questHash = {
        "apiName" => questData["QuestName"],
        "TooltipOverride" => [],
        "QuestBreakpoints" => [],
        "icon" => questData["QuestIconPath"]["texturePath"]
    }
    questData["Milestones"].each_with_index { |milestone, i|
        questHash["QuestBreakpoints"].push({
            "QuestRequirement" => milestone["MilestoneValue"],
            "QuestDesc" => milestone["MilestoneDescriptionTra"]
        })
    }
    
    tooltip = augment["tooltip"].dup
    if tooltip[/\{\{(.*?)(@f[0-9]+@)(.*?)\}\}/]
        string = $~[1]
        for j in 0...questHash["QuestBreakpoints"].length
            questHash["TooltipOverride"].push($~.pre_match + $lang.fetch((string + j.to_s).downcase, string + j.to_s) + $~.post_match)
        end
    end


    questHash["QuestBreakpoints"].push({
        "QuestDesc" => questData["QuestTooltipTra"]
    })
    
    return assetNameFix(questHash.delete_if { |k, v| v.empty? })
end

# def augmentSetBuilder(key, data, version=0)
#     if data["~class"]&.eql?("0x27bc6378")
#         set = {
#             "apiName" => data.fetch("SetName", ""),
#             "name" => data.fetch("0x746ade9", ""),
#             "desc" => data.fetch("0x97e82990", ""),
#             "descEx" => "",
#             "icons" => data.fetch("0x4217d741", ""),
#         }
#         if data["TierData"]
#             set["breakpoints"] = []
#             i = 1
#             data["TierData"].each { |tier|
#                 i += 1
#                 next if tier["Enabled"] == false
#                 set["breakpoints"].push(i)
#             }
#         else
#             set["breakpoints"] = [2, 3, 4]
#         end

#         setData = $aramMayhem[data.fetch("0x96b4b430")]
#         puts set["name"] if !setData
        
#         set["data"] = {
#             "dataValues" => {},
#             "calculations" => {}
#         }

#         mSpell = setData.fetch("mSpell", {})
#         dataValues = mSpell.fetch("DataValues", [])

#         dataValues.each { |component|
#             name = component["name"]
#             name = $lang.fetch(name, name)
#             values = component["values"] || []
#             puts "#{spellName} ::: #{name}" if !values
#             out = []
#             for i in set["breakpoints"]
#                 out.push(values[i - 1])
#             end
#             values = out
#             values = values[0] if values.uniq.length == 1
#             set["data"]["dataValues"].store(name, values)
#         }
        
#         clientData = mSpell.fetch("mClientData", {})
#         if clientData
#             descEx = clientData.dig("mTooltipData")&.dig("mLocKeys")&.dig("keyTooltip")
#             set["descEx"] = descEx ? $lang.fetch(descEx.downcase, "") : ""
#             if set["descEx"].start_with?("{{")
#                 str = set["descEx"].downcase
#                 out = {}
#                 for i in set["breakpoints"]
#                     strSub = str[2...-2].gsub("@level@", (i - 1).to_s)
#                     out.store(i, $lang.fetch(strSub, strSub))
#                 end
#                 set["descEx"] = out
#             end
#         end
#         set.delete("descEx") if set["descEx"].empty?

#         calcs = mSpell.fetch("mSpellCalculations", {})
#         set["data"]["calculations"] = applyLangKeys(applyLang(calcs))

#         set["augments"] = []
#         data["augments"].each { |aug|
#             augdata = $aramMayhem[aug]
#             if !augdata
#                 set["augments"].push(aug)
#                 next
#             end
#             name = augdata["NameTra"] ? $lang.fetch(augdata["NameTra"].downcase, aug) : aug
#             set["augments"].push(name)
#         }
        
#         set["name"] = $lang.fetch(set["name"].downcase, set["name"])
#         set["desc"] = $lang.fetch(set["desc"].downcase, set["desc"])
#         return set
#     end
#     return nil
# end

def applyLang(obj)
    case obj
        when Hash
            obj.transform_values { |v| applyLang(v) }
        when Array
            obj.map { |v| applyLang(v) }
        when String
            return itemNameLangFix($lang.fetch(obj.downcase, obj))
        else
            return obj
    end
end

# yes I know this isn't a great way to handle this but I also don't care
def applyLangKeys(obj)
    case obj
        when Hash
            obj.transform_keys { |v| applyLangKeys(v) }.transform_values { |v| applyLangKeys(v) }
        when Array
            obj.map { |v| applyLangKeys(v) }
        when String
            return $lang.fetch(obj.downcase, obj)
        else
            return obj
    end
end

def assetNameFix(obj)
    case obj
        when Hash
            obj.transform_values { |v| assetNameFix(v) }
        when Array
            obj.map { |v| assetNameFix(v) }
        when String
            return ["assets/", "uibase/", "ux/"].any? { |s| obj.downcase.include?(s) } ? obj.downcase : obj
        else
            return obj
    end
end

def itemNameLangFix(value)
    return value if !value.is_a?(String)
    return value if !value.match?("^Items/[0-9]+$") && !value.match(/\d+/)
    return "ARAM/Recall" if value == "Items/2007"
    return "DoomBots/The Collector" if value == "Items/667666" # riot typo. collector id 6676, should be 666676.
    #game_item_displayname_//
    #item_//_name\
    #generatedtip
    strings = value.split("/")
    id = strings.find { |str| str.match?(/\A[+-]?\d+\z/) }
    ret = $lang.fetch("item_#{id}_name", $lang.fetch("game_item_displayname_#{id}", $lang.fetch("generatedtip_item_#{id}_displayname", value)))
    if ret.include?("Items") && id&.length == 6
        newid = id[2...]
        ret = $lang.fetch("item_#{newid}_name", $lang.fetch("game_item_displayname_#{newid}", $lang.fetch("generatedtip_item_#{newid}_displayname", value)))
        if ret.include?("Items")
            # Arena specific items moved to other modes
            newid = "44#{newid}"
            ret = $lang.fetch("item_#{newid}_name", $lang.fetch("game_item_displayname_#{newid}", $lang.fetch("generatedtip_item_#{newid}_displayname", value)))
        end
    end

    if ret.include?("{{")
        ret.gsub!(/\{\{ .*? \}\}/) { |match|
            expr = match[2..-3].strip.downcase
            next $lang.fetch(expr, match)
        }
    end
    
    if id&.length == 4
        ret = "Swarm/#{ret}" if id.start_with?("9")
    end
    if id&.length == 6
        oldret = ret
        ret = "ARAM/#{ret}" if id.start_with?("12")
        ret = "Arena/#{ret}" if id.start_with?("22")
        ret = "Swiftplay/#{ret}" if id.start_with?("32")
        ret = "Arena/Prismatic/#{ret}" if id.start_with?("44")
        ret = "DoomBots/#{ret}" if id.start_with?("66")
        ret = "ARAMMayhem/#{ret}" if id.start_with?("99")
        ret = "#{id[0...2]}/#{ret}" if oldret == ret
    end
    return ret
end

mapBins = {
    11 => ["classic", "ruby", "swiftplay", "ultbook", "urf"],
    12 => ["aram", "firstblood", "ultbook"],
    21 => ["nexusblitz"],
    30 => ["cherry"],
    33 => ["strawberry"],
    35 => ["brawl"],
    453 => ["classic"]
}

print "Loading and formatting stringtable..."
$cdLang = {}
File.open("lang/lol.stringtable.json", 'rb') { |f| $cdLang = JSON.parse(f.read()) }
$cdLang = $cdLang["entries"] || $cdLang
File.open("lang/lol.stringtable.json", 'wb') { |f| f.write(JSON.pretty_generate($cdLang)) }
print "done.\n"

$lang = nil
File.open("lang/stringtable.json", 'rb') { |f| $lang = LangHashWrapper.new(JSON.parse(f.read())) }

champs = {}
$champLang = []

diff()

# Common handling
    print "Loading and formatting Shared data..."
    FileUtils.rm_rf(Dir.glob("shared/*"))
    ["data", "vfxData"].each { |dir|
        Dir.mkdir("shared/#{dir}") unless Dir.exist?("shared/#{dir}")
    }
    shared = {}
    File.open("temp/data/maps/shipping/common/common.json", 'rb') { |f| shared = JSON.parse(f.read()) }
    shared = shared.fetch("entries", shared)
    sharedSort = {}
    shared.each { |key, data|
        type = data["~class"]

        next if !type
        case type
            when "0x1ff0e246"
                type = "GameEndUI"
            when "0x5a92b195"
                type = "GamemodeKeybinds"
            when "0x9d9f60d2", "0xad65d8c4", "0xb26bd951", "0xe8c34b52", "0x3f04641e", "0xeb5adb26", "0x409a5657", "0x23433cc1"
                type = "skip"
            when "0x60e2ec74"
                type = "LoadScreenData"
            when "0xc3a44766"
                type = "DamageFeedbackVFX"
            when "0xe2b34203"
                type = "SharedScriptSkeleton"
            when "GameModeItemList"
                data["mItems"] = data["mItems"].map { |i| itemNameLangFix(i) }
            else
                type = "MiscData" if type.start_with?("0x")
        end
        sharedSort[type] ||= {}
        sharedSort[type].store(key, assetNameFix(data))
    }
    sharedSort.each { |key, data|
        next if key == "skip"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        File.open("shared/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }
    print "done.\n"
# Common handling end

# SR handling
    print "Loading and formatting SR data..."
    gameType = "summonersRift"
    mapId = 11
    FileUtils.rm_rf(Dir.glob("#{gameType}/*"))
    ["data", "vfxData"].each { |dir|
        Dir.mkdir("#{gameType}/#{dir}") unless Dir.exist?("#{gameType}/#{dir}")
    }
    json = {}
    File.open("temp/data/maps/shipping/map#{mapId}/map#{mapId}.json", 'rb') { |f| json = JSON.parse(f.read()) }
    json = json.fetch("entries", json)
    jsonSort = {}
    json.each { |key, data|
        type = data["~class"]

        next if !type
        case type
            when "0x1ff0e246"
                type = "GameEndUI"
            when "0x5a92b195"
                type = "GamemodeKeybinds"
            when "0x276246d8"
                type = "AnnouncerBark"
            when "0x3f04641e"
                type = "CampMapNames"
            when "0x9d9f60d2", "0xad65d8c4"
                type = "MinionSkinData"
            when "0xb26bd951", "0xe8c34b52", "0xeb5adb26", "0x409a5657", "0x23433cc1"
                type = "skip"
            when "0x60e2ec74"
                type = "LoadScreenData"
            when "0xc3a44766"
                type = "DamageFeedbackVFX"
            when "0xe2b34203"
                type = "SharedScriptSkeleton"
            when "0x6b91544a"
                type = "VfxSystemDefinitionData"
            when "0x64ee2fb1"
                type = "DragonMinimapData"
            when "0x610a14d0"
                type = "BossCountdown"
            when "0x5858e503"
                type = "Events"
            when "0x8873e4c8"
                type = "JungleObjectiveScriptData"
            when "0x292991be"
                type = "DragonSoulNames"
            when "0xb26bd951"
                type = "MapUnitSkinData"
            when "GameModeItemList"
                data["mItems"] = data["mItems"].map { |i| itemNameLangFix(i) }
            else
                type = "MiscData" if type.start_with?("0x")
        end
        jsonSort[type] ||= {}
        jsonSort[type].store(key, assetNameFix(data))
    }
    jsonSort.each { |key, data|
        next if key == "skip"
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        File.open("#{gameType}/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }


    mapBins[mapId].each { |map|
        Dir.mkdir("#{gameType}/#{map}") unless Dir.exist?("#{gameType}/#{map}")
        ["data", "vfxData"].each { |dir|
            Dir.mkdir("#{gameType}/#{map}/#{dir}") unless Dir.exist?("#{gameType}/#{map}/#{dir}")
        }
        json = {}
        File.open("temp/data/maps/modespecificdata/map#{mapId}/#{map}.json", 'rb') { |f| json = JSON.parse(f.read()) }
        json = json.fetch("entries", json)
        jsonSort = {}

        json.each { |key, data|
            type = data["~class"]

            next if !type
            case type
                when "0xc8400f38", "0x5307f5e1"
                    type = "HotkeyControls"
                else
                    type = "MiscData" if type.start_with?("0x")
            end
            jsonSort[type] ||= {}
            jsonSort[type].store(key, assetNameFix(data))
        }
        jsonSort.each { |key, data|
            loc = key.downcase.include?("vfx") ? "vfxData" : "data"
            data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
            File.open("#{gameType}/#{map}/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
        }
    }
    print "done.\n"
# SR handling end

# jade handling
    print "Loading and formatting Jade data..."
    gameType = "jade"
    mapId = 453
    FileUtils.rm_rf(Dir.glob("#{gameType}/*"))
    ["data", "vfxData"].each { |dir|
        Dir.mkdir("#{gameType}/#{dir}") unless Dir.exist?("#{gameType}/#{dir}")
    }
    json = {}
    File.open("temp/data/maps/shipping/map#{mapId}/map#{mapId}.json", 'rb') { |f| json = JSON.parse(f.read()) }
    json = json.fetch("entries", json)
    jsonSort = {}
    json.each { |key, data|
        type = data["~class"]

        next if !type
        case type
            when "0x1ff0e246"
                type = "GameEndUI"
            when "0x5a92b195"
                type = "GamemodeKeybinds"
            when "0x276246d8"
                type = "AnnouncerBark"
            when "0x3f04641e"
                type = "CampMapNames"
            when "0x9d9f60d2", "0xad65d8c4"
                type = "MinionSkinData"
            when "0xb26bd951", "0xe8c34b52", "0xeb5adb26", "0x409a5657", "0x23433cc1"
                type = "skip"
            when "0x60e2ec74"
                type = "LoadScreenData"
            when "0xc3a44766"
                type = "DamageFeedbackVFX"
            when "0xe2b34203"
                type = "SharedScriptSkeleton"
            when "0x6b91544a"
                type = "VfxSystemDefinitionData"
            when "0x64ee2fb1"
                type = "DragonMinimapData"
            when "0x610a14d0"
                type = "BossCountdown"
            when "0x5858e503"
                type = "Events"
            when "0x8873e4c8"
                type = "JungleObjectiveScriptData"
            when "0x292991be"
                type = "DragonSoulNames"
            when "0xb26bd951"
                type = "MapUnitSkinData"
            when "GameModeItemList"
                data["mItems"] = data["mItems"].map { |i| itemNameLangFix(i) }
            else
                type = "MiscData" if type.start_with?("0x")
        end
        jsonSort[type] ||= {}
        jsonSort[type].store(key, assetNameFix(data))
    }
    jsonSort.each { |key, data|
        next if key == "skip"
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        File.open("#{gameType}/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }


    mapBins[mapId].each { |map|
        Dir.mkdir("#{gameType}/#{map}") unless Dir.exist?("#{gameType}/#{map}")
        ["data", "vfxData"].each { |dir|
            Dir.mkdir("#{gameType}/#{map}/#{dir}") unless Dir.exist?("#{gameType}/#{map}/#{dir}")
        }
        json = {}
        File.open("temp/data/maps/modespecificdata/map#{mapId}/#{map}.json", 'rb') { |f| json = JSON.parse(f.read()) }
        json = json.fetch("entries", json)
        jsonSort = {}

        json.each { |key, data|
            type = data["~class"]

            next if !type
            case type
                when "0xc8400f38", "0x5307f5e1"
                    type = "HotkeyControls"
                else
                    type = "MiscData" if type.start_with?("0x")
            end
            jsonSort[type] ||= {}
            jsonSort[type].store(key, assetNameFix(data))
        }
        jsonSort.each { |key, data|
            loc = key.downcase.include?("vfx") ? "vfxData" : "data"
            data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
            File.open("#{gameType}/#{map}/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
        }
    }
    print "done.\n"
# jade handling end

# ARAM handling
    print "Loading and formatting ARAM data..."
    FileUtils.rm_rf(Dir.glob("aram/*"))
    ["data", "vfxData"].each { |dir|
        Dir.mkdir("aram/#{dir}") unless Dir.exist?("aram/#{dir}")
    }
    aram = {}
    File.open("temp/data/maps/shipping/map12/map12.json", 'rb') { |f| aram = JSON.parse(f.read()) }
    aram = aram.fetch("entries", aram)
    aramOther = {}
    aram.each { |key, data|
        type = data["~class"]

        next if !type
        case type
            when "0x3f04641e"
                type = "RelicsMapMarker"
            when "0x5a92b195"
                type = "GamemodeKeybinds"
            when "0x6b3ef1bd"
                type = "SurrenderData"
            when "0x9d9f60d2", "0xad65d8c4", "0xb26bd951"
                type = "MinionSkins"
            when "0x60e2ec74"
                type = "LoadScreenData"
            when "0x409a5657"
                type = "DefaultAugmentData"
            when "0x5b559303"
                type = "ChampionAugmentTagList"
                data = applyLangKeys(applyLang(data))
            when "0x23433cc1"
                type = "AugmentNameModifiers"
            when "0xc3a44766"
                type = "DamageFeedbackVFX"
            when "0xe2b34203"
                type = "ARAMScriptSkeleton"
            when "0xe8c34b52"
                type = "AugmentColors"
            when "0xeb5adb26"
                type = "AugmentList"
            when "0x1ff0e246"
                type = "GameEndUI"
            when "GameModeItemList"
                data["mItems"] = data["mItems"].map { |i| itemNameLangFix(i) }
            when "0xadaf4f78", "0xf9e46502"
                type = "ChampionAugmentList"
                data = applyLangKeys(applyLang(data))
                key = applyLangKeys(key)

                key = key.split("/")[-1]
                newdata = {}
                data["AugmentList"].each { |group|
                    weight = group.fetch("WEIGHT", 100)
                    group = group["AugmentGroup"].split("/")[-1]
                    newdata.store(group, weight)
                }
                data = newdata.sort_by { |k, v| k.downcase }.to_h
            else
                type = "MiscData" if type.start_with?("0x")
        end
        aramOther[type] ||= {}
        aramOther[type].store(key, assetNameFix(data))
    }
    aramOther.each { |key, data|
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        data = data.sort_by { |k, v| k }.to_h if key == "ChampionAugmentList"
        File.open("aram/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }

    Dir.children("temp/data/maps/modespecificdata/map12/").each { |map|
        map = map[...-5]
        next if map == "augments" || map == "kiwi" || map == "kiwi_jade"
        Dir.mkdir("aram/#{map}") unless Dir.exist?("aram/#{map}")
        ["data", "vfxData"].each { |dir|
            Dir.mkdir("aram/#{map}/#{dir}") unless Dir.exist?("aram/#{map}/#{dir}")
        }
        json = {}
        File.open("temp/data/maps/modespecificdata/map12/#{map}.json", 'rb') { |f| json = JSON.parse(f.read()) }
        json = json.fetch("entries", json)
        jsonSort = {}

        json.each { |key, data|
            type = data["~class"]

            next if !type
            case type
                when "0xc8400f38"
                    type = "HotkeyControls"
                when "0xadaf4f78", "0xf9e46502"
                    type = "AugmentOperators"
                    data = applyLangKeys(applyLang(data))
                when "0xfead7e9b"#, "AugmentGroups"
                    type = "AugmentGroups"
                    data = applyLangKeys(applyLang(data))
                    key = applyLangKeys(key)
                    key = data["ID"]
                    data = data["augments"]&.map { |h| h["Augment"].split("/")[-1] } || []
                else
                    type = "MiscData" if type.start_with?("0x")
            end
            jsonSort[type] ||= {}
            jsonSort[type].store(key, assetNameFix(data))
        }
        jsonSort.each { |type, data|
            loc = type.downcase.include?("vfx") ? "vfxData" : "data"
            data = data.sort_by { |k, v| v["ObjectName"] }.to_h if type == "SpellObject"
            data = data.sort_by { |k, v| k.downcase }.to_h if type == "AugmentGroups"
            File.open("aram/#{map}/#{loc}/#{type}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
        }
    }

    Dir.mkdir("aram/mayhem") unless Dir.exist?("aram/mayhem")
    ["augments", "data", "vfxData"].each { |dir|
        Dir.mkdir("aram/mayhem/#{dir}") unless Dir.exist?("aram/mayhem/#{dir}")
    }
    Dir.mkdir("aram/jade") unless Dir.exist?("aram/jade")
    ["augments", "data", "vfxData"].each { |dir|
        Dir.mkdir("aram/jade/#{dir}") unless Dir.exist?("aram/jade/#{dir}")
    }

    aramSets = []
    $aramMayhem = {}
    File.open("temp/data/maps/modespecificdata/map12/kiwi.json", 'rb') { |f| $aramMayhem = JSON.parse(f.read()) }
    $aramMayhem = $aramMayhem.fetch("entries", $aramMayhem)
    aramAugments = []
    aramOther = {}
    aramOther["AugmentInfo"] = {}
    augmentList = []
    $aramMayhem.each { |key, data|
        v = augmentSearcher(key, data, 1)

        if v
            aramAugments.push(v)
            aramOther["AugmentInfo"].store(key, assetNameFix(applyLang(data)))
            next
        end

        type = data["~class"]
        case type 
            when "0x27bc6378"
                aramSets.push(augmentSetBuilder(key, data, 1))
                next
            when "0xeb5adb26"
                type = "AugmentList"
                data = applyLangKeys(applyLang(data))
                augmentList = data["AugmentList"]
            when "0x8d31b69b"
                type = "AugmentQuestData"
                data = applyLangKeys(applyLang(data))
            when "0xa0ffdf09"
                type = "AugmentQuestList"
                data = applyLangKeys(applyLang(data))
            else
                #do nothing
        end

        next if !type
        aramOther[type] ||= {}
        aramOther[type].store(key, assetNameFix(data))
    }
    aramAugments.each { |augment|
        id = "Maps/ModeSpecificData/Augments/" + augment["apiName"]
        idHex = "0x" + fnv(id.downcase)
        if augmentList.include?(idHex)
            augmentList[augmentList.index(idHex)] = id
        end

        if augment["quest"]
            augment["quest"] = buildAugmentQuest(augment, aramOther["AugmentQuestData"][augment["quest"]["QUEST"]])
        end
    }
    File.open("aram/mayhem/augments/augments.json", 'wb') { |f| f.write(JSON.pretty_generate(aramAugments.sort_by { |a| a["id"] })) }
    #File.open("aram/mayhem/augments/sets.json", 'wb') { |f| f.write(JSON.pretty_generate(aramSets)) }
    aramOther.each { |key, data|
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        data = data.sort_by { |k, v| v["AugmentPlatformId"] }.to_h if key == "AugmentInfo"
        File.open("aram/mayhem/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }
    print "done.\n"

    $aramMayhem = {}
    File.open("temp/data/maps/modespecificdata/map12/kiwi_jade.json", 'rb') { |f| $aramMayhem = JSON.parse(f.read()) }
    $aramMayhem = $aramMayhem.fetch("entries", $aramMayhem)
    aramAugments = []
    aramOther = {}
    aramOther["AugmentInfo"] = {}
    augmentList = []
    $aramMayhem.each { |key, data|
        v = augmentSearcher(key, data, 1)

        if v
            aramAugments.push(v)
            aramOther["AugmentInfo"].store(key, assetNameFix(applyLang(data)))
            next
        end

        type = data["~class"]
        case type 
            when "0x27bc6378"
                aramSets.push(augmentSetBuilder(key, data, 1))
                next
            when "0xeb5adb26"
                type = "AugmentList"
                data = applyLangKeys(applyLang(data))
                augmentList = data["AugmentList"]
            when "0x8d31b69b"
                type = "AugmentQuestData"
                data = applyLangKeys(applyLang(data))
            when "0xa0ffdf09"
                type = "AugmentQuestList"
                data = applyLangKeys(applyLang(data))
            else
                #do nothing
        end

        next if !type
        aramOther[type] ||= {}
        aramOther[type].store(key, assetNameFix(data))
    }
    aramAugments.each { |augment|
        id = "Maps/ModeSpecificData/Augments/" + augment["apiName"]
        idHex = "0x" + fnv(id.downcase)
        if augmentList.include?(idHex)
            augmentList[augmentList.index(idHex)] = id
        end

        if augment["quest"]
            augment["quest"] = buildAugmentQuest(augment, aramOther["AugmentQuestData"][augment["quest"]["QUEST"]])
        end
    }
    File.open("aram/jade/augments/augments.json", 'wb') { |f| f.write(JSON.pretty_generate(aramAugments.sort_by { |a| a["id"] })) }
    aramOther.each { |key, data|
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        begin
            data = data.sort_by { |k, v| v["AugmentPlatformId"] }.to_h if key == "AugmentInfo"
        rescue
            puts "broke on #{key}"
        end
        File.open("aram/jade/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }
    print "done.\n"
# ARAM handling end

# Arena handling
    print "Loading and formatting Arena data..."
    $arena = {}
    File.open("temp/data/maps/shipping/map30/map30.json", 'rb') { |f| $arena = JSON.parse(f.read()) }
    FileUtils.rm_rf(Dir.glob("arena/*"))
    ["augments", "data", "vfxData"].each { |dir|
        Dir.mkdir("arena/#{dir}") unless Dir.exist?("arena/#{dir}")
    }
    $arena = $arena.fetch("entries", $arena)
    augments = []
    arenaOther = {}
    arenaOther["AugmentInfo"] = {}
    augmentList = []
    $arena.each { |key, data|
        v = augmentSearcher(key, data)
        if v
            augments.push(v) 
            arenaOther["AugmentInfo"].store(key, assetNameFix(applyLang(data)))
            next
        end

        type = data["~class"]
        next if !type
        case type
            when "0xfe44baa3"
                type = "GuestsOfHonor"
            when "0x5a92b195"
                type = "GamemodeKeybinds"
            when "0x6b3ef1bd"
                type = "SurrenderData"
            when "0xe8c34b52"
                type = "AugmentColors"
            when "0x62ba66ab"
                type = "GuestsOfHonorList"
                data["0x886394e"] = data["0x886394e"].map { |m| $arena.dig(m, "name") }
            when "0x409a5657"
                type = "DefaultAugmentData"
                augmentPools = data["0x857c9848"]
                augmentPools.each { |pool|
                    for i in 0...pool["AugmentPool"].length
                        augment = pool["AugmentPool"][i]
                        next
                        name = $lang.dig($arena.dig(augment, "NameTra")&.downcase) || augment
                        data["0x857c9848"][augmentPools.index(pool)]["AugmentPool"][i] = name
                    end
                }
                fallbackPools = data["0x857c9848"]
            when "0x23433cc1"
                type = "AugmentNameModifiers"
            when "GameModeItemList"
                data["mItems"] = data["mItems"].map { |i| itemNameLangFix(i) }
            when "AnvilData"
                data = applyLang(data)
            else
                type = "MiscData" if type.start_with?("0x")
        end
        arenaOther[type] ||= {}
        arenaOther[type].store(key, assetNameFix(data))
    }



    mapBins[30].each { |map|
        Dir.mkdir("arena/#{map}") unless Dir.exist?("arena/#{map}")
        ["data", "vfxData"].each { |dir|
            Dir.mkdir("arena/#{map}/#{dir}") unless Dir.exist?("arena/#{map}/#{dir}")
        }
        json = {}
        File.open("temp/data/maps/modespecificdata/map30/#{map}.json", 'rb') { |f| json = JSON.parse(f.read()) }
        json = json.fetch("entries", json)
        jsonSort = {}
        jsonSort["AugmentInfo"] = {}

        json.each { |key, data|
            type = data["~class"]
            v = augmentSearcher(key, data, json)
            if v
                augments.push(v) 
                jsonSort["AugmentInfo"].store(key, assetNameFix(applyLang(data)))
                next
            end

            next if !type
            case type
                when "0xc8400f38", "0x5307f5e1"
                    type = "HotkeyControls"
                when "0x5c8aed6"
                    type = "GuestOfHonorData"
                    data = applyLangKeys(applyLang(data))
                when "0x276246d8"
                    type = "AnnouncerBark"
                when "0xeb5adb26"
                    type = "AugmentList"
                    data = applyLangKeys(applyLang(data))
                    augmentList = data["AugmentList"]
                else
                    type = "MiscData" if type.start_with?("0x")
            end
            jsonSort[type] ||= {}
            jsonSort[type].store(key, assetNameFix(data))
        }
        jsonSort.each { |key, data|
            loc = key.downcase.include?("vfx") ? "vfxData" : "data"
            data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
            data = data.sort_by { |k, v| v["AugmentPlatformId"] }.to_h if key == "AugmentInfo"
            File.open("arena/#{map}/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
        }
    }
    augments.each { |augment|
        id = "Maps/ModeSpecificData/Augments/" + augment["apiName"]
        idHex = "0x" + fnv(id.downcase)
        if augmentList.include?(idHex)
            augmentList[augmentList.index(idHex)] = id
        end
    }
    augments.delete_if {|aug|
        aug["id"] > 1000 && !augmentList.any? {|a| a.end_with?(aug["apiName"])}
    }
    
    File.open("arena/augments/augments.json", 'wb') { |f| f.write(JSON.pretty_generate(augments.sort_by { |a| a["id"] })) }
    arenaOther.each { |key, data|
        loc = key.downcase.include?("vfx") ? "vfxData" : "data"
        data = data.sort_by { |k, v| v["ObjectName"] }.to_h if key == "SpellObject"
        data = data.sort_by { |k, v| v["AugmentPlatformId"] }.to_h if key == "AugmentInfo"
        File.open("arena/#{loc}/#{key}.json", 'wb') { |f| f.write(JSON.pretty_generate(data)) }
    }
    print "done.\n"
# Arena handling end

manual = [
    "cassiopeia_death"
]
print "Loading and formatting character data..."
FileUtils.rm_rf(Dir.glob("champions/*"))
FileUtils.rm_rf(Dir.glob("characters/*"))
Dir.mkdir("characters/summonersRift")
Dir.mkdir("characters/aram")
Dir.mkdir("characters/shared")
["", "/map11", "/map12"].each { |r|
    root = "temp#{r}/data/characters/"
    r2 = "/shared" if r == ""
    r2 = "/summonersRift" if r == "/map11"
    r2 = "/aram" if r == "/map12"
    r2 = "/arena" if r == "/map30"
    r2 = "/swarm" if r == "/map33"
    Dir.each_child(root) { |path|
        basepath = root + path

        Dir.each_child(basepath) { |file|
            filepath = basepath + "/" + file
            champ = {}
            File.open(filepath, 'rb') { |f| champ = JSON.parse(f.read()) }
            champ = champ.fetch("entries", champ)

            if path.include?("_") && !manual.include?(path)
                outdir = "characters#{r2}/" + path.split("_")[0]
                Dir.mkdir("#{outdir}") if !Dir.exist?("#{outdir}")
            else
                outdir = "characters#{r2}"
            end
            Dir.mkdir("#{outdir}/#{path}") if !Dir.exist?("#{outdir}/#{path}")

            out = {}
            champ.each { |obj, data|
                d = applyLang(data)
                clazz = d["~class"] || "Misc"
                
                case clazz
                    when "StatStoneSet", "StatStoneData"
                        clazz = "Eternals"
                    when "CharacterRecord"
                        clazz = "BaseStats"
                        d = applyLangKeys(d)
                        d = d.sort_by { |k, v| k }.to_h
                        d.keys.each { |k|
                            if d[k].is_a?(Hash) && d[k]["~class"] == "ModifiableFloat"
                                d[k] = applyLangKeys(d[k])
                            end
                        }
                        if d["primaryAbilityResource"]
                            d["primaryAbilityResource"] = applyLangKeys(d["primaryAbilityResource"])
                            d["primaryAbilityResource"] = d["primaryAbilityResource"].sort_by { |k, v| k }.to_h
                            d["primaryAbilityResource"].keys.each { |k|
                                d["primaryAbilityResource"][k] = applyLangKeys(d["primaryAbilityResource"][k])
                            }
                        end
                        if d["secondaryAbilityResource"]
                            d["secondaryAbilityResource"] = applyLangKeys(d["secondaryAbilityResource"])
                            d["secondaryAbilityResource"] = d["secondaryAbilityResource"].sort_by { |k, v| k }.to_h
                            d["secondaryAbilityResource"].keys.each { |k|
                                d["secondaryAbilityResource"][k] = applyLangKeys(d["secondaryAbilityResource"][k])
                            }
                        end
                        if d["platformEnabled"]
                            outdir = "champions"
                            Dir.mkdir("#{outdir}/#{path}") if !Dir.exist?("#{outdir}/#{path}")
                        end
                    when "ItemRecommendationOverrideSet", "RecSpellRankUpInfolist", "ItemRecommendationContextList",
                        "ChampionRuneRecommendationsContext", "JunglePathRecommendation", "SkinCharacterMetaDataProperties"
                        next
                    when "SpellObject"
                        clazz = "Spells"
                        d.delete_if { |key, values| values["~class"] == "BotsSpellData" }
                    else
                        #do nothing
                end

                out[clazz] ||= {}
                out[clazz].store(obj, assetNameFix(d))
            }
            next if out.empty?

            champ.extend(Hashie::Extensions::DeepFind)
            dataNames = {}
            champ.deep_find_all("name")&.each { |n|
                dataNames.store("0x#{fnv(n.downcase)}", n)
            }

            out.each { |filename, json|
                json = json.sort_by { |k, v| v["ObjectName"] } if filename == "SpellObject"
                str = JSON.pretty_generate(json)
                dataNames.each { |h, n|
                    str.gsub!(h, n)
                }
                File.open("#{outdir}/#{path}/#{filename}.json", 'wb') { |f| f.write(str) }
            }
        }
    }
}
print "done.\n"

print "Loading and formatting item data..."
itemBin = {}
items = {}
itemsSpells = {}
itemsVFX = {}
itemsTFT = {}
itemsMisc = {}
File.open("temp/data/items.ltk.json", 'rb') { |f| itemBin = JSON.parse(f.read()) }
itemBin = itemBin.fetch("entries", itemBin)
itemBin.each { |item, itemObj|
    transObj = assetNameFix(applyLang(itemObj))
    transItem = itemNameLangFix(item)
    if transItem.include?("TFT")
        itemsTFT.store(transItem, transObj)
        next
    end
    if transObj["~class"]
        case transObj["~class"]
            when "ItemData"
                transItem = transObj["itemID"].to_s + "/" + transItem if items.key?(transItem)
                items.store(transItem, transObj)
            when "SpellObject"
                itemsSpells.store(transItem, transObj)
            when "VfxSystemDefinitionData"
                itemsVFX.store(transItem, transObj)
            else
                itemsMisc.store(transItem, transObj)
        end
    else
        itemsMisc.store(transItem, transObj)
    end
}

File.open("items/items.json", 'wb') { |f| f.write(JSON.pretty_generate(items))}#.sort_by { |k, v| v["itemID"] }.to_h)) }
File.open("items/itemsMisc.json", 'wb') { |f| f.write(JSON.pretty_generate(itemsMisc)) }
File.open("items/itemsVFX.json", 'wb') { |f| f.write(JSON.pretty_generate(itemsVFX)) }
File.open("items/itemsSpells.json", 'wb') { |f| f.write(JSON.pretty_generate(itemsSpells)) }
print "done.\n"

print "Loading and formatting tft.stringtable..."
tft = {}
File.open("lang/tft.stringtable.json", 'rb') { |f| tft = JSON.parse(f.read()) }
tft = tft["entries"] || tft
File.open("lang/tft.stringtable.json", 'wb') { |f| f.write(JSON.pretty_generate(tft)) }

print "done.\n"

print "Loading and formatting loadtips..."
loadtips1 = {}
$cdLang.each { |key, string|
    next if !key.start_with?("game_startup_tip_") || key.start_with?("game_startup_tip_category")
    id, category = key.split("game_startup_tip_")[1].split("_")
    loadtips1[category] ||= {}
    loadtips1[category].store(key, string)
}

globals = {}
File.open("temp/globals.ltk.json") { |f| globals = JSON.parse(f.read()) }
globals = globals.fetch("entries", globals)
loadtipSets = {}
globals.each { |key, value|
    if value.is_a?(Hash)
        loadtipSets.store(key, value) if value["~class"] == "LoadScreenTipSet"
    end
}

loadtips = {}
loadtipSets.each { |key, value|
    name = value["mName"]
    case name.downcase
        when "gamemodex"
            name = "Nexus Blitz"
        when "cherry"
            name = "Arena"
        when "strawberry"
            name = "Swarm"
        when "0xa110bc47"
            name = "Brawl"
        when "0x28ba866a"
            name = "Worlds"
        when "0x56b5590"
            name = "Battle of the God-Kings"
        else
            # do nothing
    end
    list = value["mTips"]
    loadtips[name] = []
    list.each { |tip|
        d = {}
        tipData = globals[tip]
        next if !tipData
        text = tipData.dig("mLocalizationKey") || tip
        next if text == "unused"
        prefix = tipData.dig("mHeaderLocalizationKey")
        d.store("type", $lang.fetch(prefix&.downcase, prefix))
        d.store("text", $lang.fetch(text.downcase, tft.fetch(text.downcase, text)))
        d.store("minimumLevel", tipData["mMinimumSummonerLevel"])
        d.store("maximumLevel", tipData["mMaximumSummonerLevel"])
        d.delete_if { |k, v| v.nil? }
        loadtips[name].push(d)
    }
}
loadtips.delete_if { |k, v| v.empty? || v.nil? }
usedStrings = []
loadtips.each { |name, tips|
    usedStrings += tips.map { |t| t["text"] }
}
for cat in loadtips1.keys
    for key in loadtips1[cat].keys
        loadtips1[cat].delete(key) if usedStrings.include?(loadtips1[cat][key])
    end
end
loadtips1.delete_if { |k, v| v.empty? || v.nil? }
loadtips.store("Unused", loadtips1)



File.open("loadtips/loadtips.json", 'wb') { |f| f.write(JSON.pretty_generate(loadtips)) }

print "done.\n"


print "Loading and formatting runes..."
FileUtils.rm_rf(Dir.glob("perks/*"))
Dir.mkdir("perks") unless Dir.exist?("perks")
runes = nil
File.open("temp/perks.ltk.json", 'rb') { |f| runes = JSON.parse(f.read()) }
runes = runes.fetch("entries", runes)
runes.delete_if { |k, v| !v["~class"].include?("Perk") || v["~class"] == "PerkConfig" || v["~class"].downcase.include?("vfx") }
runes.transform_keys! { |k, v| 
    next k if !k.start_with?("0x")
    name = runes[k].dig("mIconTextureName")
    next k if !name
    name[7...name.length - 4]
}
runes = runes.sort_by { |k, v| k }.to_h
runes = applyLang(runes)

runes.each { |key, value|
    next if key == "Perks/Template"
    next if key.include?("Particles")

    spl = key.split("/")
    filename = spl[-1]
    if value["~class"] == "PerkStyle"
        path = spl.join("/")
    else
        n = -1
        n = -2 if spl[-1] == spl[-2]
        path = spl[0...n].join("/")
    end
    temp = ""
    path.split("/").each { |s| 
        temp += "#{s}/"
        Dir.mkdir(temp) unless Dir.exist?(temp)
        
    } unless Dir.exist?(path)
    File.open(path + "/#{filename}.json", 'wb') { |f| f.write(JSON.pretty_generate(assetNameFix(value)))}
}

print "done.\n"
