

function Trig_SkillAreaActions takes nothing returns nothing
    local real  x 
    local real  y 
    if (((GetSpellAbilityId() == 'A08F') or (GetSpellAbilityId() == 'A086'))) then
    // 火焰折跃  雷暴   
 

        if ((GetSpellAbilityId() == 'A08F')) then
            set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * GetHeroAgi(GetTriggerUnit() , true)  * 2  / 5
        else
            // 一指惊雷等级
            set udg_Hero_Damage =  GetUnitAbilityLevel(GetTriggerUnit(), 'AOcl' ) * GetHeroInt(GetTriggerUnit() , true)  * 2  / 5
   
           
        endif

        set  x = GetWidgetX(GetTriggerUnit())
        set  y = GetWidgetY(GetTriggerUnit())
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )


        set  x = GetSpellTargetX()
        set  y = GetSpellTargetY()
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )

        
       
     
    elseif (GetSpellAbilityId() == 'A08J')     then
    // 重锤击
         
    
        set  x = GetWidgetX(GetTriggerUnit())
        set  y = GetWidgetY(GetTriggerUnit())

        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * GetHeroStr(GetTriggerUnit() , true)  * 2  / 5
    
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )

        // 设置攻击力等级
        call SetUnitAbilityLevel(GetTriggerUnit(), 'A0BM',  (GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) + 2))
         
         
    elseif ((GetSpellAbilityId() == 'AUls')) then
    // 雷动九天

        set  x = GetWidgetX(GetTriggerUnit())
        set  y = GetWidgetY(GetTriggerUnit())
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * GetHeroInt(GetTriggerUnit() , true)   

        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )

     
    elseif ((GetSpellAbilityId() == 'ANht')) then
    // 狮子吼 杂种!
     
        set  x = GetWidgetX(GetTriggerUnit())
        set  y = GetWidgetY(GetTriggerUnit())
        set udg_Hero_Damage = 2 * GetHeroStr(GetTriggerUnit() , true)   

        if  ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'rnsp') == true)) then

        //丈八判断
    
        set udg_Hero_Damage = udg_Hero_Damage * 2
        endif

        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )

     
    elseif ((GetSpellAbilityId() == 'AHtc')) then
        set  x = GetWidgetX(GetTriggerUnit())
        set  y = GetWidgetY(GetTriggerUnit())

    // 雷霆一击
          if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I007') == true)) then
          //拥有巨象
            set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * GetHeroStr(GetTriggerUnit() , true)  / 2
        else
             
            set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * GetHeroStr(GetTriggerUnit() , true)  / 3
        endif

        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )    
     
    elseif ((GetSpellAbilityId() == 'A088')) then
    // 星坠术
         
        
        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
        set udg_Hero_Damage = 3 * GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti()  
       

        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 400 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )

         
    elseif ((GetSpellAbilityId() == 'AUfn')   ) then
    // 飓风冰爆
 
    
        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  *  GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
        // 佩带镇魂 伤害 翻倍
        if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I00C') == true)  ) then
            set udg_Hero_Damage = 2 *udg_Hero_Damage  
        endif
       

        
        // 造成 法术 强化 伤害
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )


   
    elseif ((GetSpellAbilityId() == 'AHbz') or (GetSpellAbilityId() == 'AHfs')) then
    //玄冰风暴 //火炎阵
        
        
        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  *  GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
     
   
        // 造成 法术 强化 伤害
        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 600 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
         
    elseif ((GetSpellAbilityId() == 'ANc2')) then
    //苍穹箭

        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
        // 基础伤害 智力 * 技能等级
        set udg_Hero_Damage = GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())  *  GetHeroInt(GetTriggerUnit() , true) * HeroDamageMulti() 
     
         if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'flag') == true)) then
            set udg_Hero_Damage  = udg_Hero_Damage * 3 / 2
            call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 500 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
         else
             // 造成 法术 强化 伤害
            call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 330 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
         endif
    elseif  ((GetSpellAbilityId() == 'AOsh')) then
        //落雷
        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
     
        call CreateUnit( GetTriggerPlayer(),'hwt2' ,x ,y ,0 )
       
        set udg_Hero_Damage =   GetHeroInt(GetTriggerUnit(),true ) *  GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) * HeroDamageMulti()
        

        
        // 拥有霹雳雷鸣 落雷范围 翻倍
        if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I02H') == true)) then
            // 造成 法术 强化 伤害
            call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 600 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
         
        else
            // 造成 法术 强化 伤害 
            call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 300 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )
        endif
         
      
   
     
    elseif ((GetSpellAbilityId() == 'ANsb')) then
    //雷霆战斧

        set  x =  GetSpellTargetX()
        set  y =  GetSpellTargetY()
        set udg_Hero_Damage = GetHeroInt(GetTriggerUnit(), true)  * HeroDamageMulti()

        if (((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'dsum') == true) or (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'axas') == true) or (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'gsou') == true) or (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'ocor') == true) or (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I008') == true))) then
        //拥有斧类武器
            set udg_Hero_Damage = udg_Hero_Damage * (GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId()) + 2 )
        else
            set udg_Hero_Damage = udg_Hero_Damage * GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())
        endif
 
        call CreateUnit(GetTriggerPlayer(), 'hwt3' , x , y ,0)

        call GroupEnumUnitsInRange(udg_GroupFormHero ,x , y , 225 , Condition(function GroupDamgeFilterUnitNormalENHANCED)  )  
    endif
    
endfunction

//===========================================================================
function InitTrig_SkillArea takes nothing returns nothing
    set gg_trg_SkillArea = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillArea, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillArea, Condition(function AreaSkillIsHeroConditions))
    call TriggerAddAction(gg_trg_SkillArea, function Trig_SkillAreaActions)
endfunction

