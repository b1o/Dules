class EnemyHero 
	@@name = "Juggernaut"
	@@enemy_hp = 100
	def print_hero_hp_e
		puts "Enemy HP: #{@@enemy_hp}"
	end

	def dead?
		if @@enemy_hp <= 0
			puts "You killed that bitch\n==============================================================\n\t Made by: Danail Stoyanov and Martin Stoyanov\n=============================================================="
			gets.chomp
			abort("OMG FUCKING NOOB GO AWAY")
		end
	end

	attr_accessor :enemy_hp
end	

class Hero < EnemyHero
	@@main_hero_hp = 100
	@@main_hero_mana = 80
	def print_hero_hp_m
		puts "Your HP: #{@@main_hero_hp}"
	end

	def light_attack(hero_name)
		@@l_mana_req = 8
		@enemy_hero = hero_name
		@damage = 8 + rand(5)
		if @@main_hero_mana - @@l_mana_req < 0
			puts "Bitch, you aint have no mana \t Mana left: #{@@main_hero_mana}!"
		else
			@@main_hero_mana = @@main_hero_mana - @@l_mana_req
			@@enemy_hp = @@enemy_hp - @damage
			puts "You dealt #{@damage} damage to #{@@name} with light attack.\t Mana left: #{@@main_hero_mana}"
		end
	end

	def strong_attack(hero_name)
		@@s_mana_req = 16
		@enemy_hero = hero_name
		@damage = 20 + rand(5)
		if @@main_hero_mana - @@s_mana_req < 0
			puts "Bitch you aint have no mana !\t Mana left: #{@@main_hero_mana}"
		else
			@@main_hero_mana = @@main_hero_mana - @@s_mana_req
			@@enemy_hp = @@enemy_hp - @damage
			puts "You dealt #{@damage} damage to #{@@name} with strong attack.\t Mana left: #{@@main_hero_mana}"
		end	
	end

	def enemy_attack
		@e_damage = 10 + rand(10)
		@@main_hero_hp = @@main_hero_hp - @e_damage
		puts "#{@@name} dealt #{@e_damage} damage to you"
	end

	def main_hero_dead?
		if @@main_hero_hp <= 0
			puts "Omg, pleb. You lost!\n==============================================================\n\t Made by: Danail Stoyanov and Martin Stoyanov\n=============================================================="
			gets.chomp
			abort("OMG FUCKING NOOB GO AWAY")
		end
	end
end

enemy_hero = EnemyHero.new
hero = Hero.new
until enemy_hero.dead? or hero.main_hero_dead? do
	
	print "Strong(Mana: 16) or light(Mana: 8) ?"
	damage = gets.chomp
	system('cls')
	if damage == 'strong'
		hero.strong_attack(enemy_hero)
	end
	if damage == 'light'
		hero.light_attack(enemy_hero)
	end
	hero.enemy_attack
	puts "\n"
	enemy_hero.print_hero_hp_e
	hero.print_hero_hp_m
end
gets.chomp

