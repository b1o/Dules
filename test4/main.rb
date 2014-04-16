require_relative 'game.rb'
#require_relative 'Heroes.rb'
require_relative 'Error.rb'

game = Game.new
error = Error.new
error.set_os('cls')
game.player_names
player1 = game.player1
player2 = game.player2
turn = rand(2)
game.allocate_heroes
loop do
	if turn == 0
		if game.heroes_muted?(player1)
			error.muted_heroes
			player1.each {|hero| hero.change_hero_status('alive')}
			game.turn(player2, player1)	
			turn = 0
		else
			game.turn(player1, player2)
			player1.each do |hero|
				if hero.status == "muted"
					hero.status == "alive"
				end
			end
			turn = 1
		end

	else
		if game.heroes_muted?(player2)
			error.muted_heroes
			player2.each {|hero| hero.change_hero_status('alive')}
			game.turn(player1, player2)
			turn = 1
		else
			game.turn(player2, player1)
			player2.each do |hero|
				if hero.status == "muted"
					hero.status == "alive"
				end
			end
		end
		turn = 0
	end
	game.check_for_loss(player1, player2)
end
