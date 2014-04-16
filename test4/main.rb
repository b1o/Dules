require_relative 'game.rb'
require_relative 'Heroes.rb'
require_relative 'Error.rb'

game = Game.new
error = Error.new
error.set_os('cls')
game.player_names
player1 = game.player1
player2 = game.player2
turn = rand(2)
game.allocate_heroes
player1[0].mana = 0
player1[1].mana = 0
player2.each {|hero| hero.mana = 0}
player1.each {|hero| hero.hp = 20}
player2.each {|hero| hero.hp = 20}
loop do
	if turn == 0
		#if !game.heroes_mana?(player1)
		#	error.player_out_of_mana(game.player1_name)
		#	game.turn(player2, player1)
		if game.muted?(player1)
			error.muted_heroes
			player1.each {|hero| hero.change_hero_status('alive')}
			game.turn(player2, player1)	
		else
			game.turn(player1, player2)
			turn = 1
		end

	else
		#if !game.heroes_mana?(player2)
		#	error.player_out_of_mana(game.player2_name)
		#	game.turn(player1, player2)
		if game.muted?(player2)
			error.muted_heroes
			player2.each {|hero| hero.change_hero_status('alive')}
			game.turn(player1, player2)
		else
			game.turn(player2, player1)
		end
		turn = 0
	end
	game.check_for_loss(player1, player2)
end
