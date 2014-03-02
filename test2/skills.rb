class Skills
	def luccent_beam(enemy_hero_hp) #, main_hero_mp)
		#@mana = main_hero_mp
		@hp = enemy_hero_hp	
		@damage = (20 + rand(6))
		@cool_down = 5
		@mana_cost = 10
			#@mana = @mana - @mana_cost
			@hp = @hp - @damage
	end

	def blink_strike(enemy_hero_hp)#, main_hero_mp)
		#@mana = main_hero_mp
		@hp = enemy_hero_hp	
		@damage = (15 + rand(6))
		@cool_down = 5
		@mana_cost = 7
		#@mana = @mana - @mana_cost
		@hp = @hp - @damage
		
	end
end

class Hero < Skills
	attr_accessor :hpp, :manap, :name
	def initialize(name, hpp, manap) 
		@name = name
		@hpp = hpp
		@manap = manap
	end

	def victory
		system('cls')
		puts "You killed that bitch!"
		gets.chomp
		abort("Victory !")
	end

	def defeat
		system('cls')
		puts "Omg, pleb, you lost !"
		gets.chomp
		abort("Noob.")
	end
	def print_hero_stats(enemy)
		@enemy = enemy
		print "#{@enemy} - Name: #{@name}\tHp: #{@hpp}\t\tMana: #{@manap}\n"
	end

	def godmode
		@hpp = 1000000
		@manap = 100000
	end
end



