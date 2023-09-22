# Mercs Auto Splitter

**Auto Splitter for [Mercs / Senjō no Ōkami II](https://en.wikipedia.org/wiki/Mercs) SEGA Mega Drive/Genesis version.**

## Supported Emulators
* Kega Fusion v3.64

## Features
* **Works for both Arcade Mode and Original Mode.**
* **Auto Start:** Initiates the timer when control of the character is gained at the start of Mission 1.
* **Auto Split:** Splits the timer at the end of every mission. The final split occurs when character control is lost at the end of Mission 7 (for Arcade Mode) and at the end of Mission 8 (for Original Mode).
* **Auto Reset:** Reset the timer when you reset the emulator.

## Splits
**For the Auto Splitter to work properly, there must be 7 splits for Arcade Mode and 8 for Original Mode, one for each mission.**

Example for Arcade Mode:
* Mission 1
* Mission 2
* Mission 3
* Mission 4
* Mission 5
* Mission 6
* Final Mission

Example for Original Mode:
* Mission 1
* Mission 2
* Mission 3
* Mission 4
* Mission 5
* Mission 6
* Mission 7
* Final Mission

Optionally, you can use the `.lss` file found in this folder. There, all splits are already set up.

## Known Issues
**There's a minor issue that does NOT affect the timer when you're doing a speedrun.** *It's just a thing I'd like to polish in the future.*

In Mission 1, if you're full health and the timer is not running, it will sometimes start when you move or turn your character. In Original Mode, it will start if you resume the game after a pause. This is because the address `0xE031` goes to 0.

*As mentioned earlier, this does NOT impact the timer during a speedrun, as the timer is already running.*

<br>

------------
## :heart:Donations
**Donations are always greatly appreciated. Thank you for your support!**

<a href="https://www.buymeacoffee.com/devilquest" target="_blank"><img src="https://i.imgur.com/RHHFQWs.png" alt="Buy Me A Dinosaur"></a>
