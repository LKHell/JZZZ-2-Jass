function Trig_SkillAreaHengSaoConditions takes nothing returns boolean
    return (((GetSpellAbilityId() == 'A08B') or (GetSpellAbilityId() == 'AOww') or (GetSpellAbilityId() == 'A03S')))
endfunction

 


 

function Trig_SkillAreaHengSaoActions takes nothing returns nothing
    local integer  i
    local integer  iEnd
    local integer deg
    local real x 
    local real y 
    local real xSource = GetWidgetX(GetTriggerUnit())
    local real ySource = GetWidgetY(GetTriggerUnit())
 
    // if ((GetSpellAbilityId() == 'A08B')) then
    // //横扫天赋
    //     call YDWESetLocalVariableLocation("S", GetUnitLoc(GetTriggerUnit()))
    //     call YDWESetLocalVariableGroup("C", GetUnitsInRangeOfLocMatching(400.00, YDWEGetLocalVariableLocation("S"), Condition(function Trig_SkillAreaHengSaoFunc005Func002002003)))
        
    //     call ForGroupBJ(YDWEGetLocalVariableGroup("C"), function Trig_SkillAreaHengSaoFunc005Func003A)
    //     call DestroyGroup(YDWEGetLocalVariableGroup("C"))
    //     call RemoveLocation(YDWEGetLocalVariableLocation("S"))
        
    //     call YDWESetLocalVariableGroup("Q", GetUnitsInRectMatching(GetPlayableMapRect(), Condition(function Trig_SkillAreaHengSaoFunc005Func006002002)))
    //     call ForGroupBJ(YDWEGetLocalVariableGroup("Q"), function Trig_SkillAreaHengSaoFunc005Func007A)
    //     call DestroyGroup(YDWEGetLocalVariableGroup("Q"))
    
    
    // endif
    
    if ((IsUnitAlly(GetTriggerUnit(), Player(8)) == true) and ((GetSpellAbilityId() == 'AOww') or (GetSpellAbilityId() == 'A03S'))) then
        //横扫 横扫+

        set udg_Hero_Damage = GetHeroAgi(GetTriggerUnit(),true) + GetHeroStr(GetTriggerUnit(),true)
        
         
        if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I01A') == true)) then
           
            set i = 0
            set iEnd = 7
            set deg = 45
            set udg_Hero_Damage = udg_Hero_Damage +  GetHeroAgi(GetTriggerUnit(),true) 
        else
            set i = 0
            set iEnd = 3
            set deg = 90
        endif

        call GroupEnumUnitsInRange(udg_GroupFormHero ,xSource ,ySource , 400 , Condition(function GroupDamgeFilterUnitNormalENHANCED) )

        loop
            exitwhen i > iEnd

                set   x = xSource + 256 * Cos( i * deg  * bj_DEGTORAD)
                set   y = ySource + 256 * Sin( i * deg  * bj_DEGTORAD)

               
                 
                call UnitApplyTimedLife(CreateUnit(GetOwningPlayer(GetTriggerUnit()) , 'hspt' ,  x,y,0) , 'BHwe', 3.00)
          

                set i = i + 1
        endloop
        
     
    endif
    
endfunction

//===========================================================================
function InitTrig_SkillAreaHengSao takes nothing returns nothing
    set gg_trg_SkillAreaHengSao = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaHengSao, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillAreaHengSao, Condition(function Trig_SkillAreaHengSaoConditions))
    call TriggerAddAction(gg_trg_SkillAreaHengSao, function Trig_SkillAreaHengSaoActions)
endfunction

