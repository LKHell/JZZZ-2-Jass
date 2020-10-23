function Trig_SkillAreaWaveConditions takes nothing returns boolean
// 条件
//     (施放技能) 不等于 金
//     (施放技能) 不等于 炼化 
//     (施放技能) 不等于 背包切换 
//     (施放技能) 不等于 天 
//     (施放技能) 不等于 地 
//     (施放技能) 不等于 人 
//     (((触发单位) 的类型) 是 英雄) 等于 TRUE
//     Or - 任意条件成立
//         条件
//             (施放技能) 等于 梨花带雨 
//             (施放技能) 等于 烽火连天 
//             (施放技能) 等于 野火燎原 
//             (施放技能) 等于 穿云箭 R

    return ((GetSpellAbilityId() != 'AIpl') and (GetSpellAbilityId() != 'A02I') and (GetSpellAbilityId() != 'A04G') and (GetSpellAbilityId() != 'A0B0') and (GetSpellAbilityId() != 'A0AZ') and (GetSpellAbilityId() != 'A0AY') and (IsUnitIdType(GetUnitTypeId(GetTriggerUnit()), UNIT_TYPE_HERO) == true) and ((GetSpellAbilityId() == 'A04B') or (GetSpellAbilityId() == 'A06A') or (GetSpellAbilityId() == 'A09C') or (GetSpellAbilityId() == 'ANsh')))
endfunction

function Trig_SkillAreaWaveActions takes nothing returns nothing
    local real  x 
    local real  y 
    local integer skillId =  GetSpellAbilityId()
    set  x = GetWidgetX(GetTriggerUnit())
    set  y = GetWidgetY(GetTriggerUnit())

   
    // 马甲 智力3倍
    set bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(GetTriggerUnit()) ,'h002' , x , y ,0 )
    call UnitAddAbility(bj_lastCreatedUnit,skillId)
    call SetUnitAbilityLevel(bj_lastCreatedUnit,skillId, GetUnitAbilityLevel(GetTriggerUnit(),skillId))
    call UnitApplyTimedLife(bj_lastCreatedUnit, 'BHwe', 2.00)
    
 
    // 烽火连天
    if ((GetSpellAbilityId() == 'A06A')) then
        call IssueImmediateOrder(bj_lastCreatedUnit, "fanofknives")
    elseif ((GetSpellAbilityId() == 'ANsh') ) then
    //穿云箭
        set  x = GetSpellTargetX()
        set  y = GetSpellTargetY()
        call IssuePointOrder(bj_lastCreatedUnit, "shockwave", x ,y)
        
        if (  (UnitHasItemOfTypeBJ(GetTriggerUnit(), 'oven') == true)) then
            set bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(GetTriggerUnit()) ,'h002' ,x,y ,0 )
            call UnitAddAbility(bj_lastCreatedUnit,skillId)
            call SetUnitAbilityLevel(bj_lastCreatedUnit,skillId, GetUnitAbilityLevel(GetTriggerUnit(),skillId))
            call UnitApplyTimedLife(bj_lastCreatedUnit, 'BHwe', 2.00)
            call IssuePointOrder(bj_lastCreatedUnit, "shockwave", GetWidgetX(GetTriggerUnit()) , GetWidgetY(GetTriggerUnit()))
        endif
    elseif    (GetSpellAbilityId() == 'A04B')  then 
    // 梨花带雨           
        set  x = GetSpellTargetX()
        set  y = GetSpellTargetY()
        call IssuePointOrder(bj_lastCreatedUnit, "shockwave", x ,y)
    else
    // 野火燎原
        set  x = GetSpellTargetX()
        set  y = GetSpellTargetY()
        call IssuePointOrder (bj_lastCreatedUnit, "carrionswarm", x , y )
    
    endif
    
     
endfunction

//===========================================================================
function InitTrig_SkillAreaWave takes nothing returns nothing
    set gg_trg_SkillAreaWave = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaWave, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_SkillAreaWave, Condition(function Trig_SkillAreaWaveConditions))
    call TriggerAddAction(gg_trg_SkillAreaWave, function Trig_SkillAreaWaveActions)
endfunction

