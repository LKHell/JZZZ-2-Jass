globals
        // 用于造成伤害 全局变量
      unit udg_unit_Huang
endglobals


function Trig_SkillAreaHuang1Conditions takes nothing returns boolean
    // 学习玄冰真气
    return ((GetLearnedSkill() == 'AUau')) and (GetUnitTypeId(GetTriggerUnit()) == 'Hjai')
endfunction

function Trig_SkillAreaHuang1Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_SkillAreaXuanBingZhenQi)
    set udg_unit_Huang = GetTriggerUnit()
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

//===========================================================================
function InitTrig_SkillAreaHuang1 takes nothing returns nothing
    set gg_trg_SkillAreaHuang1 = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SkillAreaHuang1, EVENT_PLAYER_HERO_SKILL)
   
    call TriggerAddCondition(gg_trg_SkillAreaHuang1, Condition(function Trig_SkillAreaHuang1Conditions))
    call TriggerAddAction(gg_trg_SkillAreaHuang1, function Trig_SkillAreaHuang1Actions)
endfunction

