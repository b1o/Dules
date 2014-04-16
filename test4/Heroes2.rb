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
		@skill1_d = "Deals #{@skill1_damage} damage to a single target. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Deals #{@skill2_damage} damage to 2 random enemy heroes. Mana cost: #{@skill2_mana_cost}"
		@skill3_d = "Luna calls upon the lunar goddess to bless her or ally hero, granting 10 bonus Hp. Mana cost: #{@skill3_mana_cost}"
		@ultimate_d = "Luna deals 7 damage to all enemy units and binds them in complete darkness, making them miss their next turn. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
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
			puts "#{hero} took #{@ultimate_damage} damage."
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
		@skill2_name = "Ice Ritual"
		@skill3_name = ""
		@ultimate_name = "Chain Frost"

		@skill1_effect = "ST"
		@skill2_effect = "HEAL"
		@skill3_effect = ""
		@ultimate_effect = "AOE"

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
		@skill1_d = "Nukes the enemy target for #{@skill1_damage} damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Lich performas a ritual and sacrifices @{skill2_mana_cost} hit points in exchange for granting @{skill2_damage} mana points to an ally hero. Mana cost: #{@skill2_mana_cost}."
		@skill3_d = ""
		@ultimate_d = "Lich invokes a deadly chain of frost that bounces between enemies 6 times dealing #{@ultimate_damage} damage each time.
		Mana cost: #{@ultimate_mana_cost} "

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
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

	def skill2(ally_hero)
		@hp = @hp - @skill2_mana_cost
		@mana = @mana - @skill3_mana_cost
		ally_hero.mana += 10
		puts "#{@name} used #{@skill2_name} and healed #{ally_hero.name} for #{@skill2_damage} hit points. Mana left: #{@mana}"
		sleep(1)
	end

	def ultimate(enemy_player_pool)
		@attacks = 0
		@mana -= @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}: "
		while @attacks < 6
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

class Riki < Hero
	attr_accessor :skill1_damage, :skill2_damage, :skill3_damage
	def initialize
		@name = "Riki"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Blink Strike"
		@skill2_name = "Smoke Screen"
		@skill3_name = ""
		@ultimate_name = "Backstab"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = "ST"
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
		@skill1_d = "Riki blinks behind the enemy target and deals #{@skill1_damage} damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Riki throws a smoke bomb blinding an enemy hero, rendering him muted for his next turn. Mana cost : #{@skills_mana_cost}"
		@skill3_d = ""
		@ultimate_d = "Riki sneaks from behind and does his normal attack 3 times to an enemy hero. Mana cost #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage to him, losing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2(enemy_Hero)
		enemy_hero.status = "muted"
		puts "#{@name} used #{@skill2_name} on #{enemy_hero.name} and muted him for his next turn, losing #{@skill2_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def ultimate(enemy_Hero)
		enemy_hero.hp = enemy_hero.hp - @normal_attack_damage*3
		puts "#{@name} dealt #{@normal_attack_damage*3} using a triple normal attack!"
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
		@skill3_name = "Healing Ward"
		@ultimate_name = "Omnislash"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = ""
		@skill3_effect = "HEAL"
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
		@skill1_d = "Juggernaut unleashes his rage upon the enemy target, dealing #{@skill1_damage} damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = ""
		@skill3_d = "Using ancient Japanese DIY skills, Juggernaut builds a small ward made out of nearby garbage to warm an ally heroe hit point with {@skill3_damage} hit pointd. Mana cost: #{@skill3_mana_cost}"
		@ultimate_d = "Juggernaut uses his OP skillz, jumping 4 times around dealing 15 damage each jump. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill3_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill3_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
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

	def skill3(ally_hero)
		@mana = @mana - @skill3_mana_cost
		ally_hero.hp = ally_hero.hp + @skill3_damage
		puts "#{@name} used #{@skill3_name} on #{enemy_hero.name} and healed #{@skill3_damage} hit points, losing #{@skill3_mana_cost} mana."
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

class Tidehunter < Hero
	def initialize
		@name = "Tidehunter"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Gush"
		@skill2_name = "Anchor Smash"
		@skill3_name = ""
		@ultimate_name = "Ravage"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = "AOE"
		@skill3_effect = ""
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(6) + 1
		@skill1_damage = 25
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 30

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 25

		@normal_attack_d = "A normal attack that deals 1-6 damage and costs no mana."
		@skill1_d = "Tidehunter literally drowns an enemy hero for #{@skill1_damage}. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Tidehunter spins right round with his gigantic anchor dealing #{@skill2_damage} to all enemy heroes. Mana cost: #{@skill2_mana_cost}"
		@skill3_d = ""
		@ultimate_d = "Tidehunter causes mother nature to behave differently, causes earthquakes,volcanos...Damages all heroes with #{@ultimate_damage}. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, losing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@skill2_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @skill2_damage
			puts "#{hero} took #{@skill2_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill3(ally_hero)

	end

	def ultimate(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @ultimate_damage
			puts "#{hero} took #{@ultimate_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

class Enigma < Hero
	def initialize
		@name = "Enigma"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Malefice"
		@skill2_name = "Midnight Pulse"
		@skill3_name = ""
		@ultimate_name = "Black Hole"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "ST"
		@skill2_effect = "AOE"
		@skill3_effect = ""
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(6) + 1
		@skill1_damage = 25
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 45

		@skill1_mana_cost = 20
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 50

		@normal_attack_d = "A normal attack that deals 1-6 damage and costs no mana."
		@skill1_d = "Enigma uses mystic energy, putting the enemy hero into nightmare.Deals #{@skill1_damage} damage to a single hero. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Enigma generates a strange smoke that confuses enemies, dealing #{@skill2_damage} damage to 2 random enemy heroes and muting 1 of them for his next turn  Mana cost: #{@skill2_mana_cost}"
		@skill3_d = ""
		@ultimate_d = "Enigma fuses a legendary Black Hole sucking all enemies dealing mighty #{@ultimate_damage} damage to all heroes and mutes them for their next turn. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{enemy_hero.name} and dealt #{@skill1_damage} damage, losing #{@skill1_mana_cost} mana."
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
	# => 	@random_hero2 = enemy_player_pool[rand(enemy_player_pool.size)]
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
# =>	@random_hero2.status = "muted"
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill3(ally_hero)

	end

	def ultimate(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @ultimate_damage
			hero.status = "muted"
			puts "#{hero} took #{@ultimate_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

class Omniknight < Hero
	def initialize
		@name = "Omniknight"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Purification"
		@skill2_name = "Repel"
		@skill3_name = ""
		@ultimate_name = "Hand of God"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "HEAL"
		@skill2_effect = "ST"
		@skill3_effect = ""
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(6) + 1
		@skill1_damage = 20
		@skill2_damage = 10
		@skill3_damage = 10
		@ultimate_damage = 25

		@skill1_mana_cost = 10
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 40

		@normal_attack_d = "A normal attack that deals 1-6 damage and costs no mana."
		@skill1_d = "Omniknight heals himself or an ally hero. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Omniknight sees the sins in an enemy hero's eyes and repels him.Mutes an enemy hero for 1 turn. Mana cost: #{@skill2_mana_cost}"
		@skill3_d = ""
		@ultimate_d = "Omniknight has to read his book in order to cast this.Heals all ally heroes with #{@ultimate_damage} hit points. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(ally_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill1_damage
		puts "#{@name} used #{@skill1_name} on #{ally_Hero.name} and healed him for #{@skill1_damage} hit points, losing #{@skill1_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2(enemy_hero)
		enemy_hero.status = "muted"
		puts "#{@name} used #{@skill2_name} on #{enemy_hero.name} and muted him for his next turn, losing #{@skill2_mana_cost} mana."
		sleep(1)
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
		# TO BE IMPLEMENTED
	end

end

class Eartshaker < Hero
	def initialize
		@name = "Eartshaker"
		@hp = 5
		@mana = 2
		@dead = false
		@status = "alive"
		@skill1_name = "Fissure"
		@skill2_name = "Enchant Totem"
		@skill3_name = ""
		@ultimate_name = "Echo Slam"
		@normal_attack_name = "Normal Attack"

		@skill1_effect = "AOE"
		@skill2_effect = "ST"
		@skill3_effect = ""
		@ultimate_effect = "AOE"
		@normal_attack_effect = "ST"

		@normal_attack_damage = rand(6) + 1
		@skill1_damage = 25
		@skill2_damage = @normal_attack_damage
		@skill3_damage = 10
		@ultimate_damage = 35

		@skill1_mana_cost = 25
		@skill2_mana_cost = 15
		@skill3_mana_cost = 7
		@ultimate_mana_cost = 40

		@normal_attack_d = "A normal attack that deals 1-6 damage and costs no mana."
		@skill1_d = "Eartshaker slams the fucking ground with his totem, causing mini earthquake.Damages all enemy heroes with #{@skill1_damage}damage. Mana cost: #{@skill1_mana_cost}"
		@skill2_d = "Eartshaker charges his totem with magical powers and uses it against an enemy hero.Deals #{@skill2_damage} damage to him. Mana cost: #{@skill2_mana_cost}"
		@skill3_d = ""
		@ultimate_d = "Eartshaker gets mad at everything.Deals #{@ultimate_damage} to all enemy heroes. Mana cost: #{@ultimate_mana_cost}"

		@skills_d = [@normal_attack_d, @skill1_d, @skill2_d, @ultimate_d]
		@skills = [@normal_attack_name, @skill1_name, @skill2_name, @ultimate_name]
	end

	def normal_attack(enemy_hero)
		enemy_hero.hp -= @normal_attack_damage
		puts "#{@name} dealt #{@normal_attack_damage} using a normal attack."
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill1(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@skill1_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @ultimate_damage
			puts "#{hero} took #{@skill1_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill2(enemy_hero)
		@mana = @mana - @skill1_mana_cost
		enemy_hero.hp = enemy_hero.hp - @skill2_damage
		puts "#{@name} used #{@skill2_name} on #{enemy_hero.name} and dealt #{@skill2_damage} damage, losing #{@skill2_mana_cost} mana."
		sleep(1)
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

	def skill3(ally_hero)
	
	end

	def ultimate(enemy_player_pool)
		@mana = @mana - @ultimate_mana_cost
		puts "#{@name} used #{@ultimate_name}. Mana left: #{@mana}".upcase
		enemy_player_pool.each do |hero|
			hero.hp -= @ultimate_damage
			puts "#{hero} took #{@ultimate_damage} damage."
			sleep(1)
		end	
		puts "Press 'Enter' to continue..."
		gets.chomp
	end

end