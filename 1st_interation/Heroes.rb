class Hero
	attr_accessor :name, :hp, :mana, :skill1_name, :skill2, :skill3, :ultimate

	def inititalize(name, hp, mana, skill1)
		@name = name
		@hp = hp
		@mana = mana
		@skill1 = skill1
	end

	def print_hero_stats
		puts "Name: #{@name}, Hp: #{@hp}, Mana: #{@mana}"
	end
end


class Luna < Hero
	def initialize
		@name = "Luna"
		@hp = 2
		@mana = 70
		@skill1_name = "Lucent Beam"
	end

	def skill1(enemy_hero)
		@skill_name = "Lucent Beam"
		@damage = 20
		@mana_cost = 10
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @damage
		puts "#{@name} used #{@skill_name} on #{enemy_hero.name} and dealt #{@damage} damage to him"
	end
end

class Lich < Hero
	def initialize
		@name = "Lich"
		@hp = 2
		@mana = 80
		@skill1_name = "Frost Blast"
	end

	def skill1(enemy_hero)
		@skill_name = "Frost Blast"
		@damage = 10
		@mana_cost = 7
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @damage
		puts "#{@name} used #{@skill_name} on #{enemy_hero.name} and dealt #{@damage} damage to him"
	end
end

class Riki < Hero
	def initialize
		@name = "Riki"
		@hp = 3
		@mana = 100
		@skill1_name = "Blink Strike"
	end

	def skill1(enemy_hero)
		@skill_name = "Blink Strike"
		@damage = 7
		@mana_cost = 5
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @damage
		puts "#{@name} used #{@skill_name} on #{enemy_hero.name} and dealt #{@damage} damage to him"
	end
end

class Juggernaut < Hero
	def initialize
		@name = "Juggernaut"
		@hp = 2
		@mana = 90
		@skill1_name = "Blade Fury"
	end

	def skill1(enemy_hero)
		@skill_name = "Blade Fury"
		@damage = 30
		@mana_cost = 17
		@mana = @mana - @mana_cost
		enemy_hero.hp = enemy_hero.hp - @damage
		puts "#{@name} used #{@skill_name} on #{enemy_hero.name} and dealt #{@damage} damage to him"
	end 
end

public
def invoke_all_heroes(array)
	array = [Luna.new, Riki.new, Lich.new, Juggernaut.new]
end

