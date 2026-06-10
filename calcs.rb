require 'json'

calcs = {
  "GameCalculation": nil, # addition
  "NamedDataValueCalculationPart": nil, # mDataValue
  "StatByNamedDataValueCalculationPart": nil, # mDataValue * stat[mStat][mStatFormula]
  "NumberCalculationPart": nil, # mNumber
  "ByCharLevelInterpolationCalculationPart": nil, # mStartValue + (mEndValue - mStartValue) * (level - 1)
  "GameCalculationModified": nil, # mModifiedGameCalculation * mMultiplier
  "SumOfSubPartsCalculationPart": nil, # mSubparts.sum
  "ByCharLevelBreakpointsCalculationPart": nil, # mBreakpoints 
  "Breakpoint": nil, # mLevel1Value mAdditionalBonusAtThisLevel @ mLevel
  "StatByCoefficientCalculationPart": nil, # stat[mStat][mStatFormula] * mCoefficient
  "ProductOfSubPartsCalculationPart": nil, # mSubparts.product
  "EffectValueCalculationPart": nil, # mEffectAmount[mEffectIndex]
  "0xf3cbe7b2": nil, # skip, bot data getter
  "BuffCounterByNamedDataValueCalculationPart": nil, # mDataValue per mDataValue.lit
  "CooldownMultiplierCalculationPart": nil, # empty value idk
  "StatBySubPartCalculationPart": nil, # stat[mStat][mStatFormula] * mSubpart
  "BuffCounterByCoefficientCalculationPart": nil, # mCoefficient per mBuffName.lit
  "AbilityResourceByCoefficientCalculationPart": nil,
  "ByCharLevelFormulaCalculationPart": nil,
  "0xb22609db": nil, # 0x91d404a5 + 0xb2cd0eb0 * (level - 1)
  "ClampSubPartsCalculationPart": nil,
  "GameCalculationConditional": nil,
  "HasBuffCastRequirement": nil,
  "0xee18a47b": nil, # 0x589a59c + (0xb65bc23 - 0x589a59c) * (level - 1)
  "PercentageOfBuffNameElapsed": nil
}

stat = {
  "0": [
    "AP",
    "base AP",
    "bonus AP"
  ],
  "1": [
    "Armor",
    "base Armor",
    "bonus Armor"
  ],
  "2": [
    "AD",
    "base AD",
    "bonus AD"
  ],
  "4": [
    "AS",
    "base AS",
    "bonus AS"
  ],
  "6": [
    "MR",
    "base MR",
    "bonus MR"
  ],
  "7": [
    "MS",
    "base MS",
    "bonus MS"
  ],
  "8": [
    "Crit Chance",
    "base Crit Chance",
    "bonus Crit Chance"
  ],
  "9": [
    "Crit Damage",
    "base Crit Damage",
    "bonus Crit Damage"
  ],
  "10": [
    "CDR",
    "base CDR",
    "bonus CDR"
  ],
  "11": [
    "Ability Haste",
    "base Ability Haste",
    "bonus Ability Haste"
  ],
  "12": [
    "max Health",
    "base Health",
    "bonus Health"
  ],
  "13": [
    "current Health"
  ]
  "17": [
    "Dodge",
    "base Dodge",
    "bonus Dodge"
  ],
  "18": [
    "Lifesteal",
    "base Lifesteal",
    "bonus Lifesteal"
  ],
  "19": [
    "Spellvamp",
    "base Spellvamp",
    "bonus Spellvamp"
  ],
  "20": [
    "Omnivamp",
    "base Omnivamp",
    "bonus Omnivamp"
  ],
  "22": [
    "MagicPenFlat",
    "base MagicPenFlat",
    "bonus MagicPenFlat"
  ],
  "23": [
    "MagicPercentPen",
    "base MagicPercentPen",
    "bonus MagicPercentPen"
  ],
  "24": [
    "MagicBonusPercentPen",
    "base MagicBonusPercentPen",
    "bonus MagicBonusPercentPen"
  ],
  "25": [
    "MagicLethality",
    "base MagicLethality",
    "bonus MagicLethality"
  ],
  "26": [
    "ArmorPenFlat",
    "base ArmorPenFlat",
    "bonus ArmorPenFlat"
  ],
  "27": [
    "ArmorPercentPen",
    "base ArmorPercentPen",
    "bonus ArmorPercentPen"
  ],
  "28": [
    "ArmorBonusPercentPen",
    "base ArmorBonusPercentPen",
    "bonus ArmorBonusPercentPen"
  ],
  "29": [
    "PhysicalLethality",
    "base PhysicalLethality",
    "bonus PhysicalLethality"
  ],
  "30": [
    "Tenacity",
    "base Tenacity",
    "bonus Tenacity"
  ],
  "31": [
    "AttackRange",
    "base AttackRange",
    "bonus AttackRange"
  ],
  "32": [
    "HealthRegen",
    "base HealthRegen",
    "bonus HealthRegen"
  ],
  "33": [
    "ParRegen",
    "base ParRegen",
    "bonus ParRegen"
  ],
  "34": [
    "HSP",
    "base HSP",
    "bonus HSP"
  ]
}

def gameCalc(hash)
  case 
end