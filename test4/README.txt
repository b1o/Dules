-------------------------------------------------
There are few things you need to run this code.

1st: Obviously, Ruby.
2nd: The os gem -> gem install os
-------------------------------------------------

>ruby main.rb to run the game

Few notes:
1. The game should end as soon as both heroes from one side die.
2. Currently there is no balance in the skills or whatever.
3. Mana is yet to be implemented. Everything connected with it is just a placeholder.


===============================================================================
Update - v0.2/09.04.2014

Changelog:
1. Mana is added to the game !
2. Added easier way for handling error messages -> Error.rb
3. Added more cosmetic looks.

Bugfixes:
1. Fixed various bug with hero and spell selection.
2. Fixed a bug with the skill Moon Glaives.

To do:
1. Heal method -> Healing skills.
2. Complete the heroes skill sets.
-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:
1. Added the 'effect' variable to the skills. Omnislash and Moon glaives now work fine.

To do:
1. Mana still needs to be implemented.
2. Make the 'heal' skill effect.

-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:

1. Added the following skills:
	Omnislash
	Moon Glaives
2. Working on Lunar Blessing and healing spells -> need whole new method. 

-------------------------------------------------------------------------------
HotFix - v0.1/04.07.2014

Fixed critical big - never ending game -> changed how the check_for_loss method works.

-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:

1. Added user input handling.
2. Added dead heroes handling.
3. Some cosmetic changes.