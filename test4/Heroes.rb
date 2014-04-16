class Hero
	attr_accessor :name, :hp, :mana, :skill1_name, :skill2_name, :skill3_name, :ultimate_name, :dead, :skills, :skills_d
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage, :status
	attr_reader :skill1_d, :skill2_d, :skill3_d, :skill4_d, :skill1_effect, :skill2_effect, :skill3_effect, :ultimate_effect, :normal_attack_effect
	attr_reader :skill1_mana_cost, :skill2_mana_cost, :skill3_mana_cost, :ultimate_mana_cost, :normal_attack_name, :normal_attack_damage, :normal_attack_d

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

	def change_hero_status(input)
		@input = input
		@status = @input
	end
end


class Luna < Hero
	def initialize
		@name = "Luna"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Lucent Beam"
		@skill2_name = "Moon Glaives"
		@skill3_name = "Lunar Blessing"
		@ultimate_name = "Eclipse"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = "AOE"
		@skill3_effect = "HEAL"
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(6) + 1
		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 7

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@normal_attack_d = "A normal attack that deals 1-6 damage and costs no mana."
		@skill1_d = "Deals 20 damage to a single target. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Deals 10 damage to 2 random enemy heroes. Mana cost: #{@skill2_mana_cost}"
		@skill3_d = "Luna calls upon the lunar goddess to bless her or allay hero, granting 10 bonus Hp. Mana cost: #{@skill3_mana_cost}"
		@ultimate_d = "Luna deals 7 damage to all enemy units and binds them in complete darkness, making them miss their next turn. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} to #{enemy_hero.name} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2(enemy_player_pool)
		@heroes_to_attack = []
		@mana = @mana - @skill2_mana_cost
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
		puts "#{@name} used #{@skill2_name}. Mana left: #{@mana}"
		@heroes_to_attack.each do |hero|
			if hero.hp != 'DEAD'
				hero.hp = hero.hp - @skill2_damage
				puts "#{hero.name} took #{@skill2_damage} damage. Hp: #{hero.hp}"
				sleep(1)
			end
		end
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill3(ally_hero)
		@mana = @mana - @skill3_mana_cost
		ally_hero.hp += 10
		puts "#{@name} used #{@skill3_name} and healed #{ally_hero.name} for #{@skill3_damage} hit points. Mana left: #{@mana}"
		sleep(1)
	end

	def ultimate(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @ultimate_damage
			hero.status = "muted"
			puts "#{hero.name} took #{@ultimate_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

end

class Lich < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Lich"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Frost Blast"
		@skill2_name = ""
		@skill3_name = ""
		@ultimate_name = ""
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = ""
		@ultimate_effect = ""
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(4) + 2
		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@normal_attack_d = "A normal attack that deals 2-5 damage and costs no mana."
		@skill1_d = "Nukes the enemy target for 20 damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = ""
		@ultimate_d = ""

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} to #{enemy_hero.name} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@enemy_hero = enemy_hero
		@mana = @mana - @skill1_mana_cost
		@enemy_hero.hp = @enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2

	end
end

class Riki < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Riki"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Blink Strike"
		@skill2_name = ""
		@skill3_name = ""
		@ultimate_name = ""
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = ""
		@ultimate_effect = ""
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(2) + 4
		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@normal_attack_d = "A normal attack that deals 4-5 damage and costs no mana."
		@skill1_d = "Riki blinks behind the enemy target and deals 7 damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = ""
		@ultimate_d = ""

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} to #{enemy_hero.name} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end
end

class Juggernaut < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Juggernaut"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Blade Fury"
		@skill2_name = ""
		@skill3_name = ""
		@ultimate_name = "Omnislash"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = ""
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(5) + 3
		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@normal_attack_d = "A normal attack that deals 3-7 damage and costs no mana."
		@skill1_d = "Juggernaut unleashes his rage upon the enemy target, dealing 30 damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = ""
		@ultimate_d = "Juggernaut uses his OP skillz, jumping 4 times around dealing 15 damage each jump. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} to #{enemy_hero.name} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, loosing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
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
		puts "Press 'Enter' to continue..."
		gets.chomp
	end
end

class Dazzle
	def initialize
		@name = "Juggernaut"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Blade Fury"
		@skill2_name = ""
		@skill3_name = ""
		@ultimate_name = "Omnislash"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = ""
		@ultimate_effect = "AOE"

		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@skill1_d = "Juggernaut unleashes his rage upon the enemy target, dealing 30 damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = ""
		@ultimate_d = "Juggernaut uses his OP skillz, jumping 4 times around dealing 15 damage each jump. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end
end

class Tidehunter
	def initialize
		@name = "Juggernaut"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Blade Fury"
		@skill2_name = ""
		@skill3_name = ""
		@ultimate_name = "Omnislash"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = ""
		@ultimate_effect = "AOE"

		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 20

		@skill1_d = "Juggernaut unleashes his rage upon the enemy target, dealing 30 damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = ""
		@ultimate_d = "Juggernaut uses his OP skillz, jumping 4 times around dealing 15 damage each jump. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end
end