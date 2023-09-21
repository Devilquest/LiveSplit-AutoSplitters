/*       
_______________________________________________________________________________________________________
|                                                                                                     |
| LiveSplit Auto Splitter script for Wonder Boy III: Monster Lair (SEGA Mega Drive/Genesis Version).  |
| Supported Emulators:                                                                                |
|   - Kega Fusion v3.64                                                                               |
|   - SEGA Mega Drive/Genesis Classics                                                                |
|   - SEGA Game Room                                                                                  |
|                                                                                                     |
| Made by Devilquest:                                                                                 |
|   - Twitch: https://www.twitch.tv/devilquest                                                        |
|   - GitHub: https://github.com/Devilquest/LiveSplit-AutoSplitters                                   |
|_____________________________________________________________________________________________________|

*/

state("Fusion")
{
    byte startTrigger   : 0x2A52D4, 0xF7DF;
    byte endTrigger     : 0x2A52D4, 0xC11B;
    byte gameLevel      : 0x2A52D4, 0x9091;
}

state("SEGAGenesisClassics")
{
    byte startTrigger   : 0x71704, 0xF7DE;
    byte endTrigger     : 0x71704, 0xC119;
    byte gameLevel      : 0x71704, 0x9090;
}

state("SEGAGameRoom")
{
    byte startTrigger   : "GenesisEmuWrapper.dll", 0xB677E8, 0xF7DE;
    byte endTrigger     : "GenesisEmuWrapper.dll", 0xB677E8, 0xC119;
    byte gameLevel      : "GenesisEmuWrapper.dll", 0xB677E8, 0x9090;
}

startup
{
    //Supported Emulators
    settings.Add("supportedEmulators", true, "Supported Emulators:");
    settings.Add("emulatorFusion", true, "Kega Fusion v3.64", "supportedEmulators");
    settings.Add("emulatorSEGAGenesisClassics", true, "SEGA Genesis Classics", "supportedEmulators");
    settings.Add("emulatorSEGAGameRoom", true, "SEGA Game Room", "supportedEmulators");
}

init
{
    refreshRate = 30;

    vars.currentLevel = 1;
    vars.split = false;
}

update
{
    if(timer.CurrentPhase == TimerPhase.Running && current.gameLevel > 0x00 && current.gameLevel < 0x0A && current.gameLevel > vars.currentLevel)
    {
        vars.currentLevel = current.gameLevel;
        vars.split = true;
    }
    else if(timer.CurrentPhase == TimerPhase.Running && old.gameLevel == 0x0A && current.gameLevel == 0x0A && old.endTrigger > 0x00 && current.endTrigger > 0x00)
    {
         vars.split = true;
    }    
}

start
{
    if(old.startTrigger == 0x00 && current.startTrigger == 0x01){
        vars.currentLevel = 1;
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
    return current.gameLevel == 0x0B;
}
