function Trig_SkillAreaDiLieJiaoConditions takes nothing returns boolean
    // 英雄， 地裂脚
    return ((IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true) and (GetSpellAbilityId() == 'AOws'))
endfunction

function Trig_SkillAreaDiLieJiaoXuChu takes nothing returns boolean
    if (((GetUnitTypeId(GetFilterUnit()) != 'Hant') and (IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false))) then

        call UnitDamageTargetBJ(GetTriggerUnit(), GetFilterUnit(), udg_Hero_Damage , ATTACK_TYPE_NORMAL, DAMAGE_TYPE_ENHANCED)
        // 追加 移动效果
        call SetUnitPosition(GetFilterUnit(),  GetWidgetX(GetTriggerUnit()) ,GetWidgetY(GetTriggerUnit())  )
    endif

    return false
endfunction

 
function Trig_SkillAreaDiliejiao takes nothing returns boolean
    if (((UnitHasBuffBJ(GetFilterUnit(), 'BNht') == true) and (IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false))) then
         call UnitDamageTargetBJ(GetTriggerUnit(), GetFilterUnit(), udg_Hero_Damage , ATTACK_TYPE_NORMAL, DAMAGE_TYPE_ENHANCED)
    endif
    return false
endfunction
 

function Trig_SkillAreaDiLieJiaoActions takes nothing returns nothing
    local real x =GetWidgetX(GetTriggerUnit())
    local real y =GetWidgetY(GetTriggerUnit())

    local integer damage = GetUnitAbilityLevel( GetTriggerUnit() ,GetSpellAbilityId()) * GetHeroStr(GetTriggerUnit(), true)
    
     
         
    if ((GetUnitTypeId(GetTriggerUnit()) == 'Hmbr')) then
    //许褚 单独判断
            
        set udg_Hero_Damage = damage /2
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 600 , Condition(function Trig_SkillAreaDiLieJiaoXuChu)  )

    elseif  ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'rnsp') == true)) then

    //丈八判断
    
        set udg_Hero_Damage = damage /2
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 400 , Condition(function Trig_SkillAreaDiliejiao)  )

    else
        
        set udg_Hero_Damage = damage  /3
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 400 , Condition(function Trig_SkillAreaDiliejiao)  )

    endif
        
     
  
  
endfunction

//===========================================================================
function InitTrig_SkillAreaDiLieJiao takes nothing returns nothing
    set gg_trg_SkillAreaDiLieJiao = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaDiLieJiao, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillAreaDiLieJiao, Condition(function Trig_SkillAreaDiLieJiaoConditions))
    call TriggerAddAction(gg_trg_SkillAreaDiLieJiao, function Trig_SkillAreaDiLieJiaoActions)
endfunction

