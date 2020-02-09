function Trig_FailedNormalActions takes nothing returns nothing
    call PolledWait(0.50)
    call RemoveUnit(GetTriggerUnit())
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 6.00, "ReplaceableTextures\\CameraMasks\\SpecialSplatMask.blp", 100.00, 50.00, 50.00, 0.00)
    call CinematicModeBJ(true, GetPlayersAll())
    call TransmissionFromUnitTypeWithNameBJ(GetPlayersAll(), Player(8), 'Hant', "关羽", GetRectCenter(gg_rct_startArea), null, "大哥，三弟...", bj_TIMETYPE_ADD, 2.00, true)
    call CinematicModeBJ(false, GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "|Cffff0000关羽已经战死，游戏失败，请再接再厉！ \n 查询本图秘籍和攻略请登陆：http://jzzz.uuu9.com")
    call PolledWait(3.00)
    call CustomDefeatBJ(Player(0), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(1), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(2), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(3), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(4), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(5), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(6), udg_tsxuhun[200])
    call CustomDefeatBJ(Player(7), udg_tsxuhun[200])
endfunction

//===========================================================================
function InitTrig_FailedNormal takes nothing returns nothing
    set gg_trg_FailedNormal = CreateTrigger()
 
    call TriggerRegisterUnitEvent(gg_trg_FailedNormal, gg_unit_Hant_0005, EVENT_UNIT_DEATH)
    call TriggerAddAction(gg_trg_FailedNormal, function Trig_FailedNormalActions)
endfunction

