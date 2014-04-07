require 'os'

class Hero
	attr_accessor :name, :hp, :mana, :skill1_name, :skill2_name, :skill3_name, :ultimate_name, :dead, :skills
	attr_reader :skill1_d, :skill2_d, :skill3_d, :skill4_d

	def inititalize(name, hp, mana, skill1)
		@name = name
		@hp = hp
		@mana = mana
		@skill1 = skill1
		@skills = []
	end

	def print_hero_stats
		puts "Name: #{@name}, Hp: #{@hp}, Mana: #{@mana}"
	end

	def dead?
		if @dead == true
			return true
		else
			return false
		end
	end

	def bonus 

	end
end


class Luna < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Luna"
		@hp = 35
		@mana = 70
		@dead = false
		@skill1_name = "Lucent Beam"
		@skill2_name = "Moon Glaives"
		@skill3_name = "Lunar Blessing"
		@ultimate = "Eclipse"
		@skill1_d = "Deals 20 damage to a single target."
		@skill2_d = "Deals 10 damage to 2 random enemy heroes"
		@skill3_d = "Luna calls upon the lunar goddess to bless her or allay hero, granting bonus Hp."
		@skill1_damage = 20
		@skill2_damage = 10
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate]
	end

	def skill1(enemy_hero)
		@mana_cost = 10
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@mana_cost} mana."
		sleep(2)
	end

	def skill2(enemy_player_pool)
		@heroes_to_attack = []
		@mana_cost = 10
		@mana = @mana = @mana_cost
		@counter = 0
		while @counter < 2 
			@random_hero = enemy_player_pool[rand(enemy_player_pool.size)]
			if @heroes_to_attack.include?(@random_hero)
				@random_hero = enemy_player_pool[rand(enemy_player_pool.size)]
			else
				@heroes_to_attack << @random_hero
				@counter += 1
			end
		end
		puts "#{@name} used #{@skill2_name}."
		@heroes_to_attack.each do |hero|
			hero.hp = hero.hp - @skill2_damage
			puts "#{hero.name} took #{@skill2_damage} damage. Hp: #{hero.hp}"
			sleep(2)
		end
	end

	def skill3(ally_hero)
		@heal = 10
		@mana_cost = 15
		@mana = @mana - @mana_cost
		ally_hero.hp += @heal
		puts "#{@name} used #{@skill3_name} and healed #{ally_hero.name} for #{@heal} hit points."
		sleep(2)
	end
end

class Lich < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Lich"
		@hp = 35
		@mana = 70
		@skill1_name = "Frost Blast"
		@skill1_d = "Nukes a single enemy hero for 10 damage."
		@skill1_damage = 10
		@dead = false
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate]
	end

	def skill1(enemy_hero)
		@enemy_hero = enemy_hero
		@mana_cost = 7
		@mana = @mana - @mana_cost
		@enemy_hero.hp = @enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@mana_cost} mana."
		sleep(2)
	end

	def skill2

	end
end

class Riki < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Riki"
		@hp = 35
		@mana = 100
		@skill1_name = "Blink Strike"
		@skill1_d = "Riki uses his stealth skills to sneak behind a enemy hero and deal 7 damage to him."
		@skill1_damage = 7
		@dead = false
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate]
	end

	def skill1(enemy_hero)
		@mana_cost = 5
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@mana_cost} mana."
		sleep(2)
	end
end

class Juggernaut < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Juggernaut"
		@hp = 35
		@mana = 90
		@skill1_name = "Blade Fury"
		@skill1_d = "Juggernaut unleashes his rage upon a enemy hero, dealing 30 damage to him."
		@skill1_damage = 30
		@ultimate_name = "Omnislash"
		@ultimate_damage = 15
		@ultimate_mana_cost = 30
		@ultimate_d = "Omnislash"
		@dead = false
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def skill1(enemy_hero)
		@mana_cost = 17
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@mana_cost} mana."
		sleep(2)
	end 

	def ultimate(enemy_player_pool)
		@attacks = 0
		@mana -= @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}: "
		while @attacks < 4
			@hero_to_attack = enemy_player_pool[rand(enemy_player_pool.size)]
			if @hero_to_attack.hp != "DEAD"
				@hero_to_attack.hp -= @ultimate_damage
				@attacks += 1
				puts "#{@hero_to_attack.name} took #{@ultimate_damage}. Hp left: #{@hero_to_attack.hp}"
				sleep(1)
			end
		end
		sleep(1)
	end
end
