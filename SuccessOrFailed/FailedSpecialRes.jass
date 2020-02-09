 function Trig_FailedSpecialResConditions takes nothing returns boolean
    return ((GetUnitTypeId(GetTriggerUnit()) == 'uabo'))
endfunction

function Trig_FailedSpecialResActions takes nothing returns nothing
    call ReviveHeroLoc(gg_unit_Hant_0005, udg_GuanYuLocation, true)
     call TransmissionFromUnitTypeWithNameBJ( GetPlayersAll(), Player(PLAYER_NEUTRAL_PASSIVE), 'H00F', "姜维",udg_GuanYuLocation, null, "发动时间回溯", bj_TIMETYPE_ADD, 0, true )

endfunction

//===========================================================================
function InitTrig_FailedSpecialRes takes nothing returns nothing
    set gg_trg_FailedSpecialRes = CreateTrigger()
 
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FailedSpecialRes, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_FailedSpecialRes, Condition(function Trig_FailedSpecialResConditions))
    call TriggerAddAction(gg_trg_FailedSpecialRes, function Trig_FailedSpecialResActions)
endfunction

