require_relative 'game.rb'
require_relative 'Heroes.rb'
require_relative 'Error.rb'

game = Game.new
error = Error.new
game.set_os('cls')
game.player_names
player1 = game.player1
player2 = game.player2
turn = 0
game.allocate_heroes
player1[0].mana = 10
player1[1].mana = 10
player2.each {|hero| hero.mana = 10}
until game.check_for_loss(player1) or game.check_for_loss(player2)
	if turn == 0
		if !game.heroes_mana?(player1)
			error.player_out_of_mana(game.player1_name)
			game.turn(player2, player1)
		else
			game.turn(player1, player2)
			turn = 1
		end

	else
		if !game.heroes_mana?(player2)
			error.player_out_of_mana(game.player2_name)
			game.turn(player1, player2)
		else
			game.turn(player2, player1)
		end
		turn = 0
	end
end
