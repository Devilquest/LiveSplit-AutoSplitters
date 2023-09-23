/*       
______________________________________________________________________________________________________________
|                                                                                                            |
| LiveSplit Auto Splitter script for Streets of Rage 2 / Bare Knuckle II (SEGA Mega Drive/Genesis Version).  |
| Supported Emulators:                                                                                       |
|   - Kega Fusion v3.64                                                                                      |
|   - SEGA Mega Drive/Genesis Classics                                                                       |
|   - SEGA Game Room                                                                                         |
|                                                                                                            |
| Made by Devilquest:                                                                                        |
|   - Twitch: https://www.twitch.tv/devilquest                                                               |
|   - GitHub: https://github.com/Devilquest/LiveSplit-AutoSplitters                                          |
|____________________________________________________________________________________________________________|

*/

state("Fusion")
{
    byte gameState   : 0x2A52D4, 0xFC03; //0 = Sega Scren; 4 = Title Screen; 8 = Demo; C = Main Menu; 10 = Options; 14 = Game; 18 = Char Select; 1C = End Credits; 20 = Duel; 24 = Intro; 28 = High Score;
    byte stage       : 0x2A52D4, 0xFC43; //0 = Stage 1; 2 = Stage 2; 4 = Stage 3; 6 = Stage 4; 8 = Stage 5; 10 = Stage 6; 12 = Stage 7; 14 = Stage 8;
    byte subStage    : 0x2A52D4, 0xFC45;
    byte time        : 0x2A52D4, 0xFC3D;
    byte reset       : 0x2A52D4, 0xA021;
    byte bossLife    : 0x2A52D4, 0xF181;
    byte bossStars   : 0x2A52D4, 0xF183;
    byte end         : 0x2A52D4, 0xB105;
}

state("SEGAGenesisClassics")
{
    byte gameState   : 0x71704, 0xFC02; //0 = Sega Scren; 4 = Title Screen; 8 = Demo; C = Main Menu; 10 = Options; 14 = Game; 18 = Char Select; 1C = End Credits; 20 = Duel; 24 = Intro; 28 = High Score;
    byte stage       : 0x71704, 0xFC42; //0 = Stage 1; 2 = Stage 2; 4 = Stage 3; 6 = Stage 4; 8 = Stage 5; 10 = Stage 6; 12 = Stage 7; 14 = Stage 8;
    byte subStage    : 0x71704, 0xFC44;
    byte time        : 0x71704, 0xFC3C;
    byte reset       : 0x71704, 0xA020;
    byte bossLife    : 0x71704, 0xF180;
    byte bossStars   : 0x71704, 0xF182;
    byte end         : 0x71704, 0xB104;
}

state("SEGAGameRoom")
{
    byte gameState   : "GenesisEmuWrapper.dll", 0xB677E8, 0xFC02; //0 = Sega Scren; 4 = Title Screen; 8 = Demo; C = Main Menu; 10 = Options; 14 = Game; 18 = Char Select; 1C = End Credits; 20 = Duel; 24 = Intro; 28 = High Score;
    byte stage       : "GenesisEmuWrapper.dll", 0xB677E8, 0xFC42; //0 = Stage 1; 2 = Stage 2; 4 = Stage 3; 6 = Stage 4; 8 = Stage 5; 10 = Stage 6; 12 = Stage 7; 14 = Stage 8;
    byte subStage    : "GenesisEmuWrapper.dll", 0xB677E8, 0xFC44;
    byte time        : "GenesisEmuWrapper.dll", 0xB677E8, 0xFC3C;
    byte reset       : "GenesisEmuWrapper.dll", 0xB677E8, 0xA020;
    byte bossLife    : "GenesisEmuWrapper.dll", 0xB677E8, 0xF180;
    byte bossStars   : "GenesisEmuWrapper.dll", 0xB677E8, 0xF182;
    byte end         : "GenesisEmuWrapper.dll", 0xB677E8, 0xB104;
}

startup
{
    //Supported Emulators
    settings.Add("supportedEmulators", true, "Supported Emulators:");
    settings.Add("emulatorFusion", true, "Kega Fusion v3.64", "supportedEmulators");
    settings.Add("emulatorSEGAGenesisClassics", true, "SEGA Genesis Classics", "supportedEmulators");
    settings.Add("emulatorSEGAGameRoom", true, "SEGA Game Room", "supportedEmulators");

    //Stage Split options
    settings.Add("stageSplitsTitle", false, "Split On: Clear Title - Stage Transition");
    settings.SetToolTip("stageSplitsTitle", "Checked: The stage split will be performed when the title \"Stage X Clear\" appear.\nUnchecked: The stage split will be performed on the black screen after the score screen fades.");

	//Substages Splits
    settings.Add("subSplits", false, "Subsplits:");
    settings.Add("stage1", false, "Stage 1", "subSplits");
    settings.Add("stage2", false, "Stage 2", "subSplits");
    settings.Add("stage3", false, "Stage 3", "subSplits");
    settings.Add("stage4", false, "Stage 4", "subSplits");
    settings.Add("stage5", false, "Stage 5", "subSplits");
    settings.Add("stage6", false, "Stage 6", "subSplits");
    settings.Add("stage7", false, "Stage 7", "subSplits");
    settings.Add("stage8", false, "Stage 8", "subSplits");

    //Elevator Enemy Waves
    settings.Add("stage4-elevator", false, "Elevator Waves Splits", "stage4");
    settings.Add("stage7-elevator", false, "Elevator Waves Splits", "stage7");
    settings.Add("stage8-elevator", false, "Elevator Waves Splits", "stage8");
}

init
{
    refreshRate = 20;

    vars.currentLevel = 0x00;
}

start
{
    if(current.gameState == 0x14 && current.stage == 0x00 && current.subStage == 0x00 && current.time > 0x00 && old.time > current.time)
    {
        vars.currentLevel = 0x00;
        return true;
    }
}

reset
{
    return old.reset == 0x00 && current.reset == 0x00;
}

split
{
    #region Stage Splits
    if (settings["stageSplitsTitle"])
    {
        //Stage Clear Title Split

        //Stage 1 Split
        if(vars.currentLevel == 0x00 && current.stage == 0x00 && current.subStage == 0x0C && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 2 Split
        if(vars.currentLevel == 0x02 && current.stage == 0x02 && current.subStage == 0x0C && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 3 Split
        if(vars.currentLevel == 0x04 && current.stage == 0x04 && current.subStage == 0x10 && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 4 Split
        if(vars.currentLevel == 0x06 && current.stage == 0x06 && current.subStage == 0x16 && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 5 Split
        if(vars.currentLevel == 0x08 && current.stage == 0x08 && current.subStage == 0x0A && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 6 Split
        if(vars.currentLevel == 0x0A && current.stage == 0x0A && current.subStage == 0x0A && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }

        //Stage 7 Split
        if(vars.currentLevel == 0x0C && current.stage == 0x0C && current.subStage == 0x12 && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        {
            vars.currentLevel += 0x02;
            return true;
        }    
    }
    else
    {
        //Stage Transition Split
        
        if(old.stage < current.stage)
            return true;
    }

    //Final Split
    if(current.stage == 0x0E && current.subStage == 0x0A && current.bossStars == 0x00 && current.bossLife == 0x00 && old.end == 0x01 && current.end == 0x01)
        return true;

    #endregion

    #region Stage Subsplits
    //Stage 1 Subsplits
    if (settings["stage1"] && current.stage == 0x00)
    {
        if (old.subStage < 0x08 && current.subStage == 0x08)
            return true;

        if (old.subStage < 0x0C && current.subStage == 0x0C)
            return true;
    }

    //Stage 2 Subsplits
    if (settings["stage2"] && current.stage == 0x02)
    {
        if (old.subStage < 0x08 && current.subStage == 0x08)
            return true;

        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;

        if (old.subStage < 0x0C && current.subStage == 0x0C)
            return true;
    }

    //Stage 3 Subsplits
    if (settings["stage3"] && current.stage == 0x04)
    {
        if (old.subStage < 0x02 && current.subStage == 0x02)
            return true;

        if (old.subStage < 0x04 && current.subStage == 0x04)
            return true;
        
        if (old.subStage < 0x06 && current.subStage == 0x06)
            return true;

        if (old.subStage < 0x08 && current.subStage == 0x08)
            return true;

        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;

        if (old.subStage < 0x0C && current.subStage == 0x0C)
            return true;

        if (old.subStage < 0x10 && current.subStage == 0x10)
            return true;
    }

    //Stage 4 Subsplits
    if (settings["stage4"] && current.stage == 0x06)
    {
        if (old.subStage < 0x04 && current.subStage == 0x04)
            return true;

        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;

        //Stage 4 Elevator Subsplits
        if (settings["stage4-elevator"])
        {
            if (old.subStage < 0x0C && current.subStage == 0x0C)
            return true;

            if (old.subStage < 0x0E && current.subStage == 0x0E)
            return true;

            if (old.subStage < 0x10 && current.subStage == 0x10)
            return true;

            if (old.subStage < 0x12 && current.subStage == 0x12)
            return true;

            if (old.subStage < 0x14 && current.subStage == 0x14)
            return true;
        }
        
        if (old.subStage < 0x16 && current.subStage == 0x16)
            return true;
    }

    //Stage 5 Subsplits
    if (settings["stage5"] && current.stage == 0x08)
    {
        if (old.subStage < 0x04 && current.subStage == 0x04)
            return true;

        if (old.subStage < 0x06 && current.subStage == 0x06)
            return true;

        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;
    }

    //Stage 6 Subsplits
    if (settings["stage6"] && current.stage == 0x0A)
    {
        if (old.subStage < 0x04 && current.subStage == 0x04)
            return true;
        
        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;
    }

    //Stage 7 Subsplits
    if (settings["stage7"] && current.stage == 0x0C)
    {
        if (old.subStage < 0x06 && current.subStage == 0x06)
            return true;

        //Stage 7 Elevator Subsplits
        if (settings["stage7-elevator"])
        {
            if (old.subStage < 0x08 && current.subStage == 0x08)
                return true;

            if (old.subStage < 0x0A && current.subStage == 0x0A)
                return true;

            if (old.subStage < 0x0C && current.subStage == 0x0C)
                return true;

            if (old.subStage < 0x0E && current.subStage == 0x0E)
                return true;
        }

        if (old.subStage < 0x12 && current.subStage == 0x12)
            return true;
    }

    //Stage 8 Subsplits
    if (settings["stage8"] && current.stage == 0x0E)
    {
        if (old.subStage < 0x02 && current.subStage == 0x02)
            return true;

        //Stage 8 Elevator Subsplits
        if (settings["stage8-elevator"])
        {
            if (old.subStage < 0x04 && current.subStage == 0x04)
                return true;

            if (old.subStage < 0x06 && current.subStage == 0x06)
                return true;
        }

        if (old.subStage < 0x0A && current.subStage == 0x0A)
            return true;
    }
    #endregion
}
