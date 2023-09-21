# Streets of Rage 2 Auto Splitter

**Auto Splitter for [Streets of Rage 2 / Bare Knuckle II](https://en.wikipedia.org/wiki/Streets_of_Rage_2) SEGA Mega Drive/Genesis version.**

## Supported Emulators
* Kega Fusion v3.64
* SEGA Mega Drive/Genesis Classics
* SEGA Game Room

## Features
* **Works for any region, difficulty and for both one and two player modes.**
* **Auto Start:** Starts the timer when you can move your character at the start of Stage 1.
* **Auto Split:** Split the timer at the end of every stage. The final split is done when the title: Stage 8 Clear appear. You can choose different split options. See the [Splits](#splits) section.
* **Auto Reset:** Reset the timer when you reset the emulator.

## Options
* **Split On: Clear Title - Stage Transition:** Choose when the Stage Split is done.
	* **Checked:** The stage split will be performed when the title \"Stage X Clear\" appear. 
	* **Unchecked:** The stage split will be performed on the black screen after the score screen fades.
	
* **Subsplits:** By default there are only 8 splits, one for each stage, but there are options to set splits for every time the screen change. See the [Splits](#splits) section.

## Splits
For the Auto Splitter to work properly there must be at least 8 one for each stage. By default, the split is done at the end of every stage. But there are some options to configure the split when the screen changes, for example when you defeat Jack and enter the Barbon’s Bar in Stage 1. Or even, there are options to made splits for every stage 4, stage 7 and stage 8 elevators enemy waves. Each stage’s subsplit can be enabled individually. See the examples below:

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
  - The timer shouldn't start when the game enters demo mode.
  - Simplified the "Split On" option to make it more clear. Now there's only one checkbox (unchecked by default):
	- Checked: The stage split will be done when the title \"Stage X Clear\" appear.
  	- Unchecked: The stage split will be done on the black screen after the score screen fades.
	
<br>

------------
## :heart:Donations
**Donations are always greatly appreciated. Thank you for your support!**

<a href="https://www.buymeacoffee.com/devilquest" target="_blank"><img src="https://i.imgur.com/RHHFQWs.png" alt="Buy Me A Dinosaur"></a>