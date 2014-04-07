require_relative 'game.rb'
require_relative 'Heroes.rb'

game = Game.new
player1 = game.player1
player2 = game.player2
game.set_os('cls')
turn = 0
game.allocate_heroes
until game.check_for_loss(player1) or game.check_for_loss(player2)
	game.current_hero_status
	if turn == 0
		game.select_hero(player1)
		game.select_spell
		if game.effect == "AOE" 
			game.attack(player1, player2)
		elsif game.effect == "ST"
			game.select_enemy_hero(player2)
			game.attack(player1, player2)
		end
		turn = 1
	else
		game.select_hero(player2)
		game.select_spell
		if game.effect == "AOE"
			game.attack(player2, player1)
		elsif game.effect == "ST"
			game.select_enemy_hero(player1)
			game.attack(player2, player1)
		end
		turn = 0
	end
end


