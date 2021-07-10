# Mercs Auto Splitter

**Auto Splitter for [Mercs](https://en.wikipedia.org/wiki/Mercs) SEGA Mega Drive/Genesis version.**

## Supported Emulators
* Kega Fusion v3.64

## Features
* **Works for both Arcade Mode and Original Mode.**
* **Auto Start:** Starts the timer when control of character is gained at the start of Mission 1.
* **Auto Split:** Split the timer at the end of every mission. The final split is done when character control is lost at the end of Mission 7 (for Arcade Mode) and at the end of Mission 8 (for Original Mode).
* **Auto Reset:** Reset the timer when you reset the emulator.

## Splits
**For the Auto Splitter to work properly there must be 7 splits for Arcade Mode and 8 for Original Mode, one for each mission.**

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

Optionally you can use the `.lss` file found in this folder. There, all splits are already set up.

## Known Issues
**There's a minor issue that does NOT affect the timer when you're doing a speedrun.** *Its just a thing I'd like to polish in the future.*

In Mission 1 if you're full health and the timer is not running it sometimes will start when moving/turning your character. In Original Mode it will start if you resume the game after a pause. This is because the address `0xE031` goes to 0.

*As mentioned before this does NOT affect the timer when you're doing a speedrun, because the timer is already running.*


<br>

------------
## :heart:Donations
**Donations are always greatly appreciated. Thank you for your support!**

[![Bitcoin Badge](https://img.shields.io/badge/Bitcoin-89520e?style=flat&logo=bitcoin&logoColor=white)](#heartdonations)
[![Ethereum Badge](https://img.shields.io/badge/Ethereum-3C3C3D?style=flat&logo=ethereum&logoColor=white)](#heartdonations)
[![Dogecoin Badge](https://img.shields.io/badge/Dogecoin-C2A633?style=flat&logo=dogecoin&logoColor=white)](#heartdonations)
[![Litecoin Badge](https://img.shields.io/badge/Litecoin-A6A9AA?style=flat&logo=litecoin&logoColor=white)](#heartdonations)

**BTC:** 1M5yLyLWmELQo2e6chBZ35RkhcTUon66u5

**ETH:** 0xa6d337a733cbce6aa2f0aa72f83beced3464ee86

**DOGE:** DNm19soXsPHHSpqsMUiy75kciw9sBrqeZ8

**LTC:** MKiegbfCssBEJdtNm3tGcnAhBF2xvcQ6d1
