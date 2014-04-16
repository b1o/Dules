class Error
	attr_accessor :a
	def set_os(os)
		@a = os
		@a = @a.to_s
	end

	def hero_out_of_mana(hero)
		system(@a)
		puts "Error: #{hero.name} doesn't have enough mana for his skills."
		sleep(1)
	end

	def not_enough_mana
		system(@a)
		puts "Error. Not enough mana for that skill."
		sleep(1)
	end

	def player_out_of_mana(player)
		system(@a)
		puts "Error: #{player}'s heroes are out of mana."
		sleep(1)
	end

	def choose_dead_hero
		system(@a)
		puts "Error: This hero is dead."
		sleep(1)
	end

	def attack_dead_hero
		system(@a)
		puts "Error: This hero is already dead."
		sleep(1)
	end

	def no_spell
		system(@a)
		puts "Error: No such skill."
		sleep(1)
	end

	def no_hero
		system(@a)
		puts "Error: No such hero."
		sleep(1)
	end

	def muted_heroes
		system(@a)
		puts "Your heroes are muted."
		sleep(1)
	end
end
