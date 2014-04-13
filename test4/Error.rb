class Error
	def hero_out_of_mana(hero)
		system('cls')
		puts "Error: #{hero.name} doesn't have enough mana for his skills."
		sleep(1)
	end

	def not_enough_mana
		system('cls')
		puts "Error. Not enough mana for that skill."
		sleep(1)
	end

	def player_out_of_mana(player)
		system('cls')
		puts "Error: #{player}'s heroes are out of mana."
		sleep(1)
	end

	def choose_dead_hero
		system('cls')
		puts "Error: This hero is dead."
		sleep(1)
	end

	def attack_dead_hero
		system('cls')
		puts "Error: This hero is already dead."
		sleep(1)
	end

	def no_spell
		system('cls')
		puts "Error: No such skill."
		sleep(1)
	end

	def no_hero
		system('cls')
		puts "Error: No such hero."
		sleep(1)
	end
end