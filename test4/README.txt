-------------------------------------------------
There are few things you need to run this code.

1st: Obviously, Ruby.
2nd: You will need to clone this repository on your local machine.
3rd: After everything is done:
	>ruby main.rb to run the game
-------------------------------------------------

Few notes:
1. The game should end as soon as both heroes from one side die.
2. Currently there is no balance in the skills or whatever.


===============================================================================
Update - v0.4/16.04.2014

Changelog:
1. Added the 'Normal Attack' skill to all heroes. It deals a set amount of damage and costs no mana.
2. Changed how the game works, considering the mana factor. The heroes now start with 0 mana and will get +10 after each turn. The value is still to be decided.
3. Added new methods to Error.rb for better error handling.

Bugfixes:
1. Fixed some minor cosmetic issues.

Updated by: Danail "b1o" Stoyanov

-------------------------------------------------------------------------------
Update - v0.3/16.04.2014

Changelog:
1. Added the following skills to the game.
	Luna:
		Eclipse(Ultimate) - Luna deals 7 damage to all enemy units and binds them in complete darkness, making them miss their next turn. Mana cost: 20
		-With this Luna is now considered finished hero. Still need skill value tweek, though.
2. More cosmetic looks.
3. First turn is now randomized(It was about time.)
4. Added status variable to the heroes. The status variable can be set to 'muted' only by Luna's skill Eclipse, for now. Updates to come.

Bugfixes:
1. Fixed bug with declaring win state.
2. Fixed error displaying for dead heroes -> Hero out of mana instead of Hero is dead.

To do:
1. Add default, 0 mana cost attack to all heroes.
2. Mana regen
3. Complete the rest of the heroes.
4. More heroes.

Updated by: Danail "b1o" Stoyanov

-------------------------------------------------------------------------------
Update - v0.3/13.04.2014

Changelog:
1. The os gem is no longer required.
2. The Luna's skill "Lunar blessing" has been added to the game.
	Lunar Blessing - Luna calls upon the lunar goddess to bless her or allay hero, granting 10 bonus Hp. Mana cost: 7
3. Added healing method.
4. Removed mana as condition for win. The condition to win is back as it was -> Both heroes from one side should die.
5. Added few new error handlings in Error.rb.

To do:
1. 'Mana regen'
2. Complete the heroes skill sets.
3. Need more heroes. At least 8.

Updated by: Danail "b1o" Stoyanov
-------------------------------------------------------------------------------
Update - v0.2/09.04.2014

Changelog:
1. Mana is added to the game !
2. Added easier way for handling error messages -> Error.rb
3. Added more cosmetic looks.
4. Changed the win/loss condition. Its now involving mana.

Bugfixes:
1. Fixed various bug with hero and spell selection.
2. Fixed a bug with the skill Moon Glaives.

To do:
1. Heal method -> Healing skills.
2. Complete the heroes skill sets.
3. 'Mana regen'

Updated by: Danail "b1o" Stoyanov
-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:
1. Added the 'effect' variable to the skills. Omnislash and Moon glaives now work fine.

To do:
1. Mana still needs to be implemented.
2. Make the 'heal' skill effect.

Updated by: Danail "b1o" Stoyanov
-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:

1. Added the following skills:
	Omnislash
	Moon Glaives
2. Working on Lunar Blessing and healing spells -> need whole new method. 

Updated by: Danail "b1o" Stoyanov
-------------------------------------------------------------------------------
HotFix - v0.1/04.07.2014

Fixed critical big - never ending game -> changed how the check_for_loss method works.

-------------------------------------------------------------------------------
Update - v0.1/04.07.2014

Changelog:

1. Added user input handling.
2. Added dead heroes handling.
3. Some cosmetic changes.

Updated by: Danail "b1o" Stoyanov
