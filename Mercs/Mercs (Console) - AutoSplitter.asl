/*       
_____________________________________________________________________________________________________
|                                                                                                   |
| LiveSplit Auto Splitter script for Mercs / Senjō no Ōkami II (SEGA Mega Drive/Genesis Version).   |
| Supported Emulators:                                                                              |
|   - Kega Fusion v3.64                                                                             |
|                                                                                                   |
| Made by Devilquest:                                                                               |
|   - Twitch: https://www.twitch.tv/devilquest                                                      |
|   - GitHub: https://github.com/Devilquest/LiveSplit-AutoSplitters                                 |
|___________________________________________________________________________________________________|

Known Issues: (Minor Issue) In Mission 1, if you're full health and the timer is not running, it will sometimes start when you move or turn your character. In Original Mode, it will start if you resume the game after a pause.
              This is because the address 0xE031 goes to 0.
              This does NOT affect the timer during a speedrun, as the timer is already running.
*/

state("Fusion")
{
    byte playerHealth   : 0x2A52D4, 0xC349;
    byte playerHitbox   : 0x2A52D4, 0xE031;
    byte gameMode       : 0x2A52D4, 0xFE45; //0 = Arcade Easy; 1 = Arcade Normal; 2 = Arcade Hard; 3 = Original Normal; 4 = Original Hard;
    byte gameMission    : 0x2A52D4, 0xC329; //0-6 = Arcade Missions; 7-16 Original Missions (14 Mission 8 Start, 15 Mission 8 Enemy Headquarters, 16 Final Boss Room);
    byte finalBossLife  : 0x2A52D4, 0xE6F8;
    byte endTrigger     : 0x2A52D4, 0xC61C;
    byte resetTrigger   : 0x2A52D4, 0xD001;
    byte demoMode       : 0x2A52D4, 0xC344;
}

startup
{
    //Supported Emulators
    settings.Add("supportedEmulators", true, "Supported Emulators:");
    settings.Add("emulatorFusion", true, "Kega Fusion v3.64", "supportedEmulators");
}

init
{
    refreshRate = 30;

    vars.currentMission = 0x01;
    vars.split = false;
}

update
{
    if(timer.CurrentPhase == TimerPhase.Running){
        if(current.gameMode <= 0x02) //Arcade Mode
        {
            if(current.gameMission + 0x01 > vars.currentMission)
            {
                vars.currentMission = current.gameMission + 0x01;
                vars.split = true;
            }

            //Arcade Final Boss
            if(vars.currentMission == 0x07 && current.endTrigger == 0x24)
                vars.split = true;
        }
        else //Original Mode
        {
            if(current.gameMission < 0x0F && current.gameMission - 0x06 > vars.currentMission)
            {
                vars.currentMission = current.gameMission - 0x06;
                vars.split = true;
            }

            //Original Final Boss
            if(vars.currentMission == 0x08 && current.gameMission == 0x10 && current.finalBossLife >= 0xFF && current.endTrigger == 0x00)
                vars.split = true;
        }
    }
}

start
{
    if(current.demoMode == 0x00 && (current.gameMission == 0x00 || current.gameMission == 0x07) && old.playerHealth == 0x20 && current.playerHealth == 0x20 && old.playerHitbox == 0x00 && current.playerHitbox > 0x00)
    {
        vars.currentMission = 0x01;
        return true;
    }
}

split
{
    if(vars.split)
    {
        vars.split = false;
        return true;
    }
}

reset
{
    return current.resetTrigger == 0x00;
}
