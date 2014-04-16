require_relative 'Heroes.rb'
require_relative 'Error.rb'
require_relative 'game.rb'


game = Game.new
error = Error.new
#game.set_os('cls')
#game.player_names
player1 = game.player1
player2 = game.player2


turn = 0
game.allocate_heroes
player1.each {|hero| hero.mana = 100}
player2.each {|hero| hero.mana = 100}


game.turn(player1, player2)
game.turn(player2, player1)