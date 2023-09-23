# Streets of Rage 2 Auto Splitter

**Auto Splitter for [Streets of Rage 2 / Bare Knuckle II](https://en.wikipedia.org/wiki/Streets_of_Rage_2) SEGA Mega Drive/Genesis version.**

## Supported Emulators
* Kega Fusion v3.64
* SEGA Mega Drive/Genesis Classics
* SEGA Game Room

## Features
* **Compatible with all regions, difficulties, and both one and two-player modes.**
* **Auto Start:** Initiates the timer when you gain control of your character at the beginning of Stage 1.
* **Auto Split:** Split the timer at the end of each stage. The final split is done when the title: Stage 8 Clear appear. Various split options are available. Refer to the [Splits](#splits) section for details.
* **Auto Reset:** Reset the timer when you reset the emulator.

## Options
* **Split On: Clear Title - Stage Transition:** Choose when the Stage Split is triggered.
	* **Checked:** The stage split is triggered when the title "Stage X Clear" appears. 
	* **Unchecked:** The stage split is triggered on the black screen after the score screen fades.
	
* **Subsplits:** By default there are only 8 splits, one for each stage. However, there are options to set splits for every screen transition. See the [Splits](#splits) section for details.

## Splits
For the Auto Splitter to work properly, you must have at least 8 splits, one for each stage. By default, the split occurs at the end of each stage. Nevertheless, you have the option to configure the split to trigger when the screen changes, such as when you defeat Jack and enter Barbon’s Bar in Stage 1. Additionally, there are options to create splits for the elevator waves in stages 4, 7, and 8. Each stage's subsplits can be enabled individually. Examples are provided below:

**Example for default 8 splits:**
* Stage 1
* Stage 2
* Stage 3
* Stage 4
* Stage 5
* Stage 6
* Stage 7
* Stage 8

**Example for stage subsplits:**
* The Streets
* Barbons's Bar
* Barbon
* Bridge Construction
* Truck
* Bridge Construction
* Jet
* Amusement Park
* Arcade
* Pirates Passage 1
* Pirates Passage 2
* Pirate Ship
* Alien Entrance
* Alien
* Zamza
* Road to Stadium
* Stadium
* Elevator
* Abadede
* Ship's Hold 1
* Ship's Hold 2
* Ship's Deck
* R. Bear
* Beach
* Souther
* Factory
* Elevator
* Robots
* Bear Jr.
* Elevator
* Mr. X

**Example for stage subsplits + elevator's enemy waves:**
* The Streets
* Barbons's Bar
* Barbon
* Bridge Construction
* Truck
* Bridge Construction
* Jet
* Amusement Park
* Arcade
* Pirates Passage 1
* Pirates Passage 2
* Pirate Ship
* Alien Entrance
* Alien
* Zamza
* Road to Stadium
* Stadium
* Elevator Wave 1 (Galsias + Donovans)
* Elevator Wave 2 (Kung-fu Fighters)
* Elevator Wave 3 (Galsias + Donovans)
* Elevator Wave 4 (Galsias + Donovans + Kung-fu Fighters)
* Elevator Wave 5 (Galsias + Donovans)
* Elevator Wave 6 (Galsias + Donovans + Kung-fu Fighters)
* Abadede
* Ship's Hold 1
* Ship's Hold 2
* Ship's Deck
* R. Bear
* Beach
* Souther
* Factory
* Elevator Signals
* Elevator Jets
* Elevator Kickboxers
* Elevator Soya
* Robots
* Bear Jr.
* Vulture
* Nail
* Z. Kusano
* Mr. X

Optionally, you can use the `.lss` files found in this folder. There, all splits are already set up.

## Changelog
- **21/01/2023**
  - RefreshRate increased from 10 to 20.
  - The timer should no longer start when the game enters demo mode.
  - Simplified the "Split On" option for clarity. There is now only one checkbox (unchecked by default):
	- Checked: The stage split will occur when the title "Stage X Clear" appears.
  	- Unchecked: The stage split will occur on the black screen after the score screen fades.
	
<br>

------------
## :heart:Donations
**Donations are always greatly appreciated. Thank you for your support!**

<a href="https://www.buymeacoffee.com/devilquest" target="_blank"><img src="https://i.imgur.com/RHHFQWs.png" alt="Buy Me A Dinosaur"></a>
