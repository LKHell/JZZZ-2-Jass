

function Trig_SkillAreaActions takes nothing returns nothing
    local real x 
    local real y 
    local unit dummy = null
    set udg_Hero_Damage = 0 
    
    if((GetSpellAbilityId() == 'AUfn')   ) then
        // 飓风冰爆
        
        
        set x = GetSpellTargetX()
        set y = GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  * GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
        // 佩带镇魂 伤害 翻倍
        if((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I00C') == true)  ) then
            set udg_Hero_Damage = 2 * udg_Hero_Damage  
        endif
        
        
        
        // 造成 法术 强化 伤害
        call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        
        
        
    elseif((GetSpellAbilityId() == 'AHbz') or(GetSpellAbilityId() == 'AHfs')) then
        //玄冰风暴 //火炎阵
        
        
        set x = GetSpellTargetX()
        set y = GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  * GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
        
        
        // 造成 法术 强化 伤害
        call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 600 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        
    elseif((GetSpellAbilityId() == 'ANc2')) then
        //苍穹箭
        
        set x = GetSpellTargetX()
        set y = GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  * GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
        
        if((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'flag') == true)) then
            set udg_Hero_Damage = udg_Hero_Damage * 3 / 2
            call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        else
            // 造成 法术 强化 伤害
            call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 330 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        endif
    elseif((GetSpellAbilityId() == 'AOsh')) then
        //落雷
        set x = GetSpellTargetX()
        set y = GetSpellTargetY()
        
        call CreateUnit(GetTriggerPlayer(),'hwt2' , x , y , 0)
        
        set udg_Hero_Damage = GetHeroInt(GetTriggerUnit(), true) * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * HeroDamageMulti()
        
        
        
        // 拥有霹雳雷鸣 落雷范围 翻倍
        if((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I02H') == true)) then
            // 造成 法术 强化 伤害
            call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 600 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
            
        else
            // 造成 法术 强化 伤害 
            call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        endif
        
        
        
        
    elseif((GetSpellAbilityId() == 'ANsb')) then
        //雷霆战斧
        
        set x = GetSpellTargetX()
        set y = GetSpellTargetY()
        set udg_Hero_Damage = GetHeroInt(GetTriggerUnit(), true)  * HeroDamageMulti()
        
        if(((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'dsum') == true) or(UnitHasItemOfTypeBJ(GetTriggerUnit(), 'axas') == true) or(UnitHasItemOfTypeBJ(GetTriggerUnit(), 'gsou') == true) or(UnitHasItemOfTypeBJ(GetTriggerUnit(), 'ocor') == true) or(UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I008') == true))) then
            //拥有斧类武器
            set udg_Hero_Damage = udg_Hero_Damage * (GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) + 2)
        else
            set udg_Hero_Damage = udg_Hero_Damage * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())
        endif
        
        call CreateUnit(GetTriggerPlayer(), 'hwt3' , x , y , 0)
        
        call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 225 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  ) 
    elseif((GetSpellAbilityId() == 'AHtb')) then
        // 幻影斩
        
        set x = GetSpellTargetX() + 128 * Cos(GetUnitFacing(GetTriggerUnit()) -180.00) * bj_DEGTORAD 
        set y = GetSpellTargetY() + 128 * Sin(GetUnitFacing(GetTriggerUnit()) -180.00) * bj_DEGTORAD
        
        set udg_Hero_Damage = (GetHeroInt(GetTriggerUnit(), true) + GetHeroAgi(GetTriggerUnit(), true) -  GetHeroStr(GetTriggerUnit(), true)  )* HeroDamageMulti()
        
        // 拥有 真·青龙刀 或者 项羽战刃
        if(((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I01A') == true) or(UnitHasItemOfTypeBJ(GetTriggerUnit(), 'stre') == true))) then
            set udg_Hero_Damage = udg_Hero_Damage * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())
        else
            set udg_Hero_Damage = udg_Hero_Damage * (GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) + 2)
        endif
        
        call GroupEnumUnitsInRange(udg_GroupFormHero , x , y , 225 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        // 复制目标
        call IssueTargetOrderById(CreateUnit(GetTriggerPlayer(), 'hwt3' , x , y , 0) , 852274, GetSpellTargetUnit())
        //Move Hero
        call SetUnitPosition(GetTriggerUnit() , x, y)
    endif
    
    
    if(udg_Hero_Damage > 0) then
        
        
        //创造马甲 -》 攻击 -》 设置伤害
        set dummy = CreateUnit(GetOwningPlayer(GetTriggerUnit()),   'h000', GetUnitX(GetTriggerUnit()) , GetUnitY(GetTriggerUnit()) , bj_UNIT_FACING)
        
        call SetUnitUserData(dummy , udg_Hero_Damage)
        call UnitAddAbility(dummy,GetSpellAbilityId())
        call SetUnitAbilityLevel(dummy,  GetSpellAbilityId() ,  GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId() ))
        call IssueTargetOrder(dummy , "attackonce", GetSpellTargetUnit() )   
        
        
    endif
    
    set dummy = null
    
endfunction

// just in testing 
//===========================================================================
function InitTrig_SkillCreateDummy takes nothing returns nothing
    set gg_trg_SkillCreateDummy = CreateTrigger()
    
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillArea, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillArea, Condition(function AreaSkillIsHeroConditions))
    call TriggerAddAction(gg_trg_SkillCreateDummy, function Trig_SkillCreateDummy_Actions)
endfunction
