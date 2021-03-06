globals
      // real udg_realX
      // real udg_realY
      group udg_GroupFormHero=CreateGroup()
endglobals




//对匹配单位造成 法术 强化 伤害
function GroupDamgeFilterUnitNormalENHANCED takes nothing returns boolean
    if ((IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false)) then 
        call UnitDamageTargetBJ(GetTriggerUnit(), GetFilterUnit(), udg_Hero_Damage , ATTACK_TYPE_NORMAL, DAMAGE_TYPE_ENHANCED)
    endif

    return false
endfunction


//对匹配单位造成 法术 通用 伤害
function GroupDamgeFilterUnitNormalUNIVERSAL takes nothing returns boolean
    if ((IsUnitAlly(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) == false)) then 
        call UnitDamageTargetBJ(GetTriggerUnit(), GetFilterUnit(), udg_Hero_Damage , ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL)
    endif

    return false
endfunction

function HeroDamageMulti takes nothing returns integer
    local integer i = 1
     
    // 佩带 九天算尺 几率伤害 x2
    if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I001') == true) and GetRandomInt(1,10) > 7) then
           set i  = i * 2
    endif

    // 佩带 霹雳雷鸣 几率伤害 x2
    if ((UnitHasItemOfTypeBJ(GetTriggerUnit(), 'I02H') == true) and GetRandomInt(1,10) < 3) then
           set i  = i * 2
    endif

    return i
endfunction


// 触发单位 = 英雄
function AreaSkillIsHeroConditions takes nothing returns boolean
    return ((IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true))
endfunction

 