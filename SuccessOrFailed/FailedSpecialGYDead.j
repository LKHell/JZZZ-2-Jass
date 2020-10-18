function Trig_FailedGYDeadActions takes nothing returns nothing
    call CreateNUnitsAtLoc(1, 'uabo', GetOwningPlayer(GetTriggerUnit()), udg_GuanYuLocation, bj_UNIT_FACING)
    call UnitApplyTimedLifeBJ(3.00, 'BTLF', bj_lastCreatedUnit)
    call SetUnitUserData(gg_unit_Hant_0005, (GetUnitUserData(gg_unit_Hant_0005) + 1))
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\SpecialSplatMask.blp", 100.00, 50.00, 50.00, 0.00)
    call TransmissionFromUnitTypeWithNameBJ(GetPlayersAll(), Player(8), 'Hant', "关羽", udg_GuanYuLocation, null, "大哥，三弟，我先行一步", bj_TIMETYPE_ADD, 2.00, true)
    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("|Cffff0000关羽已经战死" + (I2S(GetUnitUserData(gg_unit_Hant_0005)) + "次")))
endfunction

//===========================================================================
function InitTrig_FailedSpecialGYDead takes nothing returns nothing
    set gg_trg_FailedSpecialGYDead = CreateTrigger()
 
    call TriggerRegisterUnitEvent(gg_trg_FailedSpecialGYDead, gg_unit_Hant_0005, EVENT_UNIT_DEATH)
    call TriggerAddAction(gg_trg_FailedSpecialGYDead, function Trig_FailedGYDeadActions)
endfunction

