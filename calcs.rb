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



def gameCalc(hash)
  case 
end