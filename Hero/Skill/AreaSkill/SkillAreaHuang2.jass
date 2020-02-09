function Trig_SkillAreaHuang2Conditions takes nothing returns boolean
// And - 所有条件成立
//     条件
//         (Uint_Huang 生命值大于零) 等于 TRUE
//         (Uint_Huang 处于隐藏状态) 等于 FALSE
//         (Uint_Huang 是镜像单位) 等于 FALSE

    return (((IsUnitAliveBJ(udg_unit_Huang) == true) and (IsUnitHiddenBJ(udg_unit_Huang) == false) and (IsUnitIllusionBJ(udg_unit_Huang) == false)))
endfunction

 

 
function Trig_SkillAreaHuang2Actions takes nothing returns nothing
    local real x = GetWidgetX(udg_unit_Huang)
    
    local real y = GetWidgetY(udg_unit_Huang)
    // 智力 * 2
    // call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\bfx.mdx", GetEnumUnit(), "overhead"))
    set udg_Hero_Damage = GetHeroInt(udg_unit_Huang, true) * 2
    call GroupEnumUnitsInRange(udg_GroupFormHero , x, y , 250 , Condition (function GroupDamgeFilterUnitNormalUNIVERSAL))

endfunction

//===========================================================================
function InitTrig_SkillAreaHuang2 takes nothing returns nothing
    set gg_trg_SkillAreaHuang2 = CreateTrigger()
    call DisableTrigger(gg_trg_SkillAreaHuang2)
 
    call TriggerRegisterTimerEventPeriodic(gg_trg_SkillAreaHuang2, 15.00)
    call TriggerAddCondition(gg_trg_SkillAreaHuang2, Condition(function Trig_SkillAreaHuang2Conditions))
    call TriggerAddAction(gg_trg_SkillAreaHuang2, function Trig_SkillAreaHuang2Actions)
endfunction

