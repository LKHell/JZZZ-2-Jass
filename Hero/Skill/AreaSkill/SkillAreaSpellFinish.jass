function Trig_SkillAreaSpellFinishActions takes nothing returns nothing
    local real  x 
    local real  y 
    if ((GetSpellAbilityId() == 'AHtb')) then
    // 幻影斩
 
        set  x =  GetSpellTargetX() + 128 * Cos(GetUnitFacing(GetTriggerUnit()) - 180.00) * bj_DEGTORAD 
        set  y =  GetSpellTargetY() + 128 * Sin(GetUnitFacing(GetTriggerUnit()) - 180.00) * bj_DEGTORAD

        set udg_Hero_Damage = (GetHeroInt(GetTriggerUnit(), true) + GetHeroAgi(GetTriggerUnit(), true) -  GetHeroStr(GetTriggerUnit(), true)  )* HeroDamageMulti()

        // 拥有 真·青龙刀 或者 项羽战刃
        if (((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I01A') == true) or (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'stre') == true))) then
            set udg_Hero_Damage = udg_Hero_Damage * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())
        else
           set udg_Hero_Damage = udg_Hero_Damage * (GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) + 2 )
        endif
        
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 225 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        // 复制目标
        call IssueTargetOrderById( CreateUnit(GetTriggerPlayer(), 'hwt3' , x , y ,0) , 852274, GetSpellTargetUnit())
        //Move Hero
        call SetUnitPosition(GetTriggerUnit() ,x,y)
       
     
    endif
    
endfunction

//===========================================================================
function InitTrig_SkillAreaSpellFinish takes nothing returns nothing
    set gg_trg_SkillAreaSpellFinish = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaSpellFinish, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_SkillAreaSpellFinish, Condition(function AreaSkillIsHeroConditions))
    call TriggerAddAction(gg_trg_SkillAreaSpellFinish, function Trig_SkillAreaSpellFinishActions)
endfunction

