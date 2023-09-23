/*       
_________________________________________________________________________________________________________
|                                                                                                       |
| LiveSplit Auto Splitter script for Streets of Rage / Bare Knuckle (SEGA Mega Drive/Genesis Version).  |
| Supported Emulators:                                                                                  |
|   - Kega Fusion v3.64                                                                                 |
|   - SEGA Mega Drive/Genesis Classics                                                                  |
|   - SEGA Game Room                                                                                    |
|                                                                                                       |
| Made by Devilquest:                                                                                   |
|   - Twitch: https://www.twitch.tv/devilquest                                                          |
|   - GitHub: https://github.com/Devilquest/LiveSplit-AutoSplitters                                     |
|_______________________________________________________________________________________________________|

*/

state("Fusion")
{
    byte gameState   : 0x2A52D4, 0xFF01; //0 = Sega Screen Init; 2 = Sega Screen; 16 = InGame; 18 Round Clear Init; 1A Roud Clear;
    byte demoMode    : 0x2A52D4, 0xFF2A;
    byte startFlag   : 0x2A52D4, 0xF1F2;
    byte stage       : 0x2A52D4, 0xFF03;
    byte subStage    : 0x2A52D4, 0xFF05;
    byte endFlag     : 0x2A52D4, 0xFA71;
    byte pause       : 0x2A52D4, 0xFA46;
}

state("SEGAGenesisClassics")
{
    byte gameState   : 0x71704, 0xFF00; //0 = Sega Screen Init; 2 = Sega Screen; 16 = InGame; 18 Round Clear Init; 1A Roud Clear;
    byte demoMode    : 0x71704, 0xFF2B;
    byte startFlag   : 0x71704, 0xF1F3;
    byte stage       : 0x71704, 0xFF02;
    byte subStage    : 0x71704, 0xFF04;
    byte endFlag     : 0x71704, 0xFA70;
    byte pause       : 0x71704, 0xFA47;
}

state("SEGAGameRoom")
{
    byte gameState   : "GenesisEmuWrapper.dll", 0xB677E8, 0xFF00; //0 = Sega Screen Init; 2 = Sega Screen; 16 = InGame; 18 Round Clear Init; 1A Roud Clear;
    byte demoMode    : "GenesisEmuWrapper.dll", 0xB677E8, 0xFF2B;
    byte startFlag   : "GenesisEmuWrapper.dll", 0xB677E8, 0xF1F3;
    byte stage       : "GenesisEmuWrapper.dll", 0xB677E8, 0xFF02;
    byte subStage    : "GenesisEmuWrapper.dll", 0xB677E8, 0xFF04;
    byte endFlag     : "GenesisEmuWrapper.dll", 0xB677E8, 0xFA70;
    byte pause       : "GenesisEmuWrapper.dll", 0xB677E8, 0xFA47;
}

startup
{
    //Supported Emulators
    settings.Add("supportedEmulators", true, "Supported Emulators:");
    settings.Add("emulatorFusion", true, "Kega Fusion v3.64", "supportedEmulators");
    settings.Add("emulatorSEGAGenesisClassics", true, "SEGA Genesis Classics", "supportedEmulators");
    settings.Add("emulatorSEGAGameRoom", true, "SEGA Game Room", "supportedEmulators");

    //Stage Split options
    settings.Add("stageSplitsOn", false, "Split On: Black Screen - Stage Transition");
    settings.SetToolTip("stageSplitsOn", "Checked: The stage split will be performed when the black screen after the stage boss fades in.\nUnchecked: The stage split will be performed on a black screen after the score screen.");

    //Category options
    settings.Add("yesPercentOption", false, "Yes%");
    settings.SetToolTip("yesPercentOption", "Checked: Yes% category. Back to stage 6 after you reach Mr. X for teh first time (11 stages).\nUnchecked: No% category. Normal game (8 stages).");

    //Pause options
    settings.Add("pauseOption", false, "Pause");
    settings.SetToolTip("pauseOption", "Checked: The timer will be paused as long as the game is paused.\nUnchecked: The timer will continue running when the game is paused.\nNote: Only works if the timer is set to \"Game Time\" in the layout.");
}

init
{
    refreshRate = 10;
}

start
{
    return current.demoMode == 0x00 && current.gameState == 0x16 && current.stage == 0x00 && current.subStage == 0x00 && current.startFlag == 0x01;
}

onStart
{
    vars.currentStage = 0x00;
    vars.yesPercent = false;
}

reset
{
    return old.gameState == 0x00 && current.gameState == 0x00;
}

//Only works if the timer is set to "Game Time" in the layout.
isLoading
{
    return settings["pauseOption"] && current.pause == 0x01;
}

split
{
    if(settings["stageSplitsOn"] && old.stage < 0x07)
    {
        //Split On: Black screen after the stage boss.
        if(current.endFlag == 0x01 && vars.currentStage == current.stage)
        {
            vars.currentStage++;
            return true;
        }
    }
    else if(old.stage < 0x07)
    {
        //Split On: Stage transition.
        return old.stage < current.stage;
    }
    else
    {
        //Final Split
        if(settings["yesPercentOption"] && old.stage > current.stage)
        {
            vars.yesPercent = true;
            vars.currentStage = current.stage;
            return true;
        }
        else if(!settings["yesPercentOption"] || vars.yesPercent)
        {
            return current.subStage == 0x06 && old.endFlag == 0x00 && current.endFlag == 0x01;
        }
    }
}
