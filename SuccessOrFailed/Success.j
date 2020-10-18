// Success
//     事件
//         单位 - |cffffdead陆逊 0044<预设> 死亡
//     条件
//     动作
//         电影 - Turn cinematic mode 打开 for (All players)
//         电影 - Send transmission to (All players) from a 中立被动.泊柛 named LK-Hao at (Center of (Playable map area)): Play 没有音效 and display 恭喜！你们已....  Modify duration: 添加 0.00 seconds and 等待
//         电影 - Turn cinematic mode 关闭 for (All players)
//         游戏 - Victory 玩家 1 (红色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 2 (蓝色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 3 (青色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 4 (紫色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 5 (黄色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 6 (橙色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 7 (绿色) (显示 dialogs, 显示 scores)
//         游戏 - Victory 玩家 8 (粉红色) (显示 dialogs, 显示 scores)

function Trig_Success_Actions takes nothing returns nothing
    call CinematicModeBJ( true, GetPlayersAll() )
    call TransmissionFromUnitTypeWithNameBJ( GetPlayersAll(), Player(PLAYER_NEUTRAL_PASSIVE), 'emtg', "TRIGSTR_004", GetRectCenter(GetPlayableMapRect()), null, "TRIGSTR_128", bj_TIMETYPE_ADD, 0, true )
    call CinematicModeBJ( false, GetPlayersAll() )
    call CustomVictoryBJ( Player(0), true, true )
    call CustomVictoryBJ( Player(1), true, true )
    call CustomVictoryBJ( Player(2), true, true )
    call CustomVictoryBJ( Player(3), true, true )
    call CustomVictoryBJ( Player(4), true, true )
    call CustomVictoryBJ( Player(5), true, true )
    call CustomVictoryBJ( Player(6), true, true )
    call CustomVictoryBJ( Player(7), true, true )
endfunction

//===========================================================================
function InitTrig_Success takes nothing returns nothing
    set gg_trg_Success = CreateTrigger(  )
    call TriggerRegisterUnitEvent( gg_trg_Success, gg_unit_Ogld_0044, EVENT_UNIT_DEATH )
    call TriggerAddAction( gg_trg_Success, function Trig_Success_Actions )
endfunction

