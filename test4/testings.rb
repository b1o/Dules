require_relative 'Heroes.rb'
require_relative 'Error.rb'
require_relative 'game.rb'


game = Game.new
error = Error.new
game.set_os('cls')
#game.player_names
player1 = game.player1
player2 = game.player2
turn = 0
game.allocate_heroes
game.hero_kill(player1[0])
player2.each {|hero| hero.mana = 20}

game.current_hero_status
game.heroes_mana?(player1)
game.check_for_loss(player1)