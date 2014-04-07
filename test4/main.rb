require_relative 'game.rb'
require_relative 'Heroes.rb'

game = Game.new
player1 = game.player1
player2 = game.player2
game.os
turn = 0
game.allocate_heroes
until game.check_for_loss(player1) or game.check_for_loss(player2)
	game.current_hero_status
	if turn == 0
		game.select_hero(player1)
		game.select_spell
		if game.selected_spell == "Omnislash" or game.selected_spell == "Moon Glaives"
			game.attack(player1, player2)
		elsif game.selected_spell == "Lunar Blessing"
			game.select_hero
		else
			game.select_enemy_hero(player2)
			game.attack(player1, player2)
		end
		turn = 1
	else
		game.select_hero(player2)
		game.select_spell
		if game.selected_spell == "Omnislash"
			game.attack(player2, player1)
		else
			game.select_enemy_hero(player1)
			game.attack(player2, player1)
		end
		turn = 0
	end
end


