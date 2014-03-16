require_relative 'Heroes.rb'

class Player
	attr_accessor :name, :heroes
	def initialize(name, heroes)
		@name = name
		@heroes = heroes
	end
end

def print_heroes(player1, player2, player1_heroes, player2_heroes)
	puts "#{player1.name}'s heroes are: #{player1_heroes[0].name}(Hp: #{player1_heroes[0].hp}, Mana: #{player1_heroes[0].mana}), #{player1_heroes[1].name}(Hp: #{player1_heroes[1].hp}, Mana: #{player1_heroes[1].mana})"
	puts "#{player2.name}'s heroes are: #{player2_heroes[0].name}(Hp: #{player2_heroes[0].hp}, Mana: #{player2_heroes[0].mana}), #{player2_heroes[1].name}(Hp: #{player2_heroes[1].hp}, Mana: #{player2_heroes[1].mana})"
	puts
end

def win(player)
	puts "#{player.name} has won the match!"
	gets.chomp
	abort()
end

def dead?(hero)
	dead = false
	if hero.hp <= 0
		dead = true
		puts "This hero is already dead. Please choose another one."
	end
	return dead
end

heroes_array = []
heroes_array = invoke_all_heroes(heroes_array)

player1_heroes = []
player2_heroes = []
player1_alive_heroes = []
player2_alive_heroes = []
counter = 0
while counter < 2 
		a = rand(heroes_array.size)
		player1_heroes << heroes_array[a]
		player1_alive_heroes << heroes_array[a]
		heroes_array.delete_at(a)
	unless player1_heroes[0] == player1_heroes[1]
		counter += 1
	end
end
counter1 = 0
while counter1 < 2 
	j = rand(heroes_array.size)
	player2_heroes << heroes_array[j]
	player2_alive_heroes << heroes_array[j]
	heroes_array.delete_at(j)
	counter1 += 1
end

print "Enter the 1st player's name: "
user_input = gets.chomp
player1 = Player.new("#{user_input}", player1_heroes)
system('cls')

print "Enter the 2nd player's name: "
user2_input = gets.chomp
player2 = Player.new("#{user2_input}", player2_heroes)
system('cls')

puts "Hello #{player1.name} and #{player2.name}!"
puts
print_heroes(player1, player2, player1_heroes, player2_heroes)
gets.chomp
system('cls')


def turn(player1, player1_heroes, player2, player2_heroes, player_alive_heroes)
	puts "#{player1.name}'s turn."
	puts "Hey, #{player1.name} ! Choose a hero to attack with: #{player1_heroes[0].name}(Hp: #{player1_heroes[0].hp}, Mana: #{player1_heroes[0].mana}), #{player1_heroes[1].name}(Hp: #{player1_heroes[1].hp}, Mana: #{player1_heroes[1].mana})"
	user_input = gets.chomp
	good = true

	case user_input
		when player1_heroes[0].name
			system('cls')
			print_heroes(player1, player2, player1_heroes, player2_heroes)
			print "Choose a spell to attack with(#{player1_heroes[0].skill1_name}): "
			spell = gets.chomp
			case spell
				when player1_heroes[0].skill1_name 
					system('cls')
					print_heroes(player1, player2, player1_heroes, player2_heroes)
					puts "Choose the hero you want to attack - #{player2_heroes[0].name}(Hp: #{player2_heroes[0].hp}, Mana: #{player2_heroes[0].mana}), #{player2_heroes[1].name}(Hp: #{player2_heroes[1].hp}, Mana: #{player2_heroes[1].mana})"
					enemy_hero = gets.chomp
					case enemy_hero 
						when player2_heroes[0].name
							system('cls')
							player1_heroes[0].skill1(player2_heroes[0])
							if player2_heroes[0].hp <= 0
								player_alive_heroes.delete_at(0)
								puts "#{player2_heroes[0].name} got pwnd"
								player2_heroes[0].name = "Dead:#{player2_heroes[0].name}"
								player2_heroes[0].hp = 0
								player2_heroes[0].mana = 0
							end
							sleep(2)
							system('cls')
							print_heroes(player1, player2, player1_heroes, player2_heroes)
							if player_alive_heroes.empty?
								win(player2)
							end
						when player2_heroes[1].name
							system('cls')
							player1_heroes[0].skill1(player2_heroes[1])
							if player2_heroes[1].hp <= 0
								player_alive_heroes.delete_at(1-1)
								puts "#{player2_heroes[1].name} got pwnd"
								player2_heroes[1].name = "Dead:#{player2_heroes[1].name}"
								player2_heroes[1].hp = 0
								player2_heroes[1].mana = 0
							end
							sleep(2)
							system('cls')
							print_heroes(player1, player2, player1_heroes, player2_heroes)
							if player_alive_heroes.empty?
								win(player2)
							end
					end
			end		
		when player1_heroes[1].name
			system('cls')
			print_heroes(player1, player2, player1_heroes, player2_heroes)
			print "Choose a spell to attack with(#{player1_heroes[1].skill1_name}): "
			spell = gets.chomp
			case spell
				when player1_heroes[1].skill1_name
					system('cls')
					print_heroes(player1, player2, player1_heroes, player2_heroes)
					puts "Choose the hero you want to attack - #{player2_heroes[0].name}(Hp: #{player2_heroes[0].hp}, Mana: #{player2_heroes[0].mana}), #{player2_heroes[1].name}(Hp: #{player2_heroes[1].hp}, Mana: #{player2_heroes[1].mana})"
					enemy_hero = gets.chomp
					case enemy_hero 
						when player2_heroes[0].name
							system('cls')
							player1_heroes[1].skill1(player2_heroes[0])
							if player2_heroes[0].hp <= 0
								player_alive_heroes.delete_at(0)
								puts "#{player2_heroes[0].name} got pwnd"
								player2_heroes[0].name = "Dead:#{player2_heroes[0].name}"
								player2_heroes[0].hp = 0
								player2_heroes[0].mana = 0
							end
							sleep(2)
							system('cls')
							print_heroes(player1, player2, player1_heroes, player2_heroes)
							if player_alive_heroes.empty?
								win(player1)
							end
						when player2_heroes[1].name
							system('cls')
							player1_heroes[1].skill1(player2_heroes[1])
							if player2_heroes[1].hp <= 0
								player_alive_heroes.delete_at(1-1)
								puts "#{player2_heroes[1].name} got pwnd"
								player2_heroes[1].name = "Dead:#{player2_heroes[1].name}"
								player2_heroes[1].hp = 0
								player2_heroes[1].mana = 0
							end
							sleep(2)
							system('cls')
							print_heroes(player1, player2, player1_heroes, player2_heroes)
							if player_alive_heroes.empty?
								win(player1)
							end
					end
			end			
	end
end

loop do
turn(player1, player1_heroes, player2, player2_heroes, player1_alive_heroes)
turn(player2, player2_heroes, player1, player1_heroes, player2_alive_heroes)
end


 