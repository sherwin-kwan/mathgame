# mathgame
Simple game as an intro to Ruby


## Class Player
* Constructor: takes name
* Property (With get/set): lives left

## Class Game
* Property: Current player
* METHOD - Calculate whether player entered the correct sum
* METHOD - Generate random math question
* METHOD - Display finishing screen

## Pseudocode

* Game starts + call Game constructor
* Prompt for Player 1 name + call Player constructor
* Prompt for Player 2 name + call Player constructor

* WHILE (both players have >= 1 life)
  * Generate random question and prompt to Player 1
  * Calculate whether input is correct
  * IF correct, toggle current player. If incorrect, decrement the Player's life property and toggle current player
* LOOP

* Upon breaking out of loop: Display winner
