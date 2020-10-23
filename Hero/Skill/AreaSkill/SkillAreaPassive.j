function Trig_SkillAreaPassiveConditions takes nothing returns boolean
//条件
    // (施放技能) 不等于 金
    // (施放技能) 不等于 炼化 
    // (施放技能) 不等于 背包切换 
    // (施放技能) 不等于 天 
    // (施放技能) 不等于 地 
    // (施放技能) 不等于 人 
    // (暴怒踏击 (中立敌对) 的等级对 (触发单位)) 大于或等于 1
    // (随机整数,最小值: 1 最大值: 20) 小于或等于 (暴怒踏击 (中立敌对) 的等级对 (触发单位))

    return ((GetSpellAbilityId() != 'AIpl') and (GetSpellAbilityId() != 'A02I') and (GetSpellAbilityId() != 'A04G') and (GetSpellAbilityId() != 'A0B0') and (GetSpellAbilityId() != 'A0AZ') and (GetSpellAbilityId() != 'A0AY') and (GetUnitAbilityLevelSwapped('ACpv', GetTriggerUnit()) >= 1) and (GetRandomInt(1, 20) <= GetUnitAbilityLevelSwapped('ACpv', GetTriggerUnit())))
endfunction

 

function Trig_SkillAreaPassiveActions takes nothing returns nothing
    local real  x = GetWidgetX(GetTriggerUnit())
    local real  y = GetWidgetY(GetTriggerUnit())
    
    
    set udg_Hero_Damage = GetHeroStr(GetTriggerUnit() ,true) * (GetUnitAbilityLevel(GetTriggerUnit(), 'ACpv')) / 4
    
    call GroupEnumUnitsInRange(udg_GroupFormHero,x, y ,400 , Condition(function GroupDamgeFilterUnitNormalENHANCED))
 
   // 马甲 地裂辅助  踩地板
    call IssueImmediateOrder (CreateUnit( GetOwningPlayer(GetTriggerUnit()) ,'hwt3',x,y,0), "stomp" )
    
    
endfunction

//===========================================================================
function InitTrig_SkillAreaPassive takes nothing returns nothing
    set gg_trg_SkillAreaPassive = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaPassive, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillAreaPassive, Condition(function Trig_SkillAreaPassiveConditions))
    call TriggerAddAction(gg_trg_SkillAreaPassive, function Trig_SkillAreaPassiveActions)
endfunction

