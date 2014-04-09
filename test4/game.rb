require_relative 'Heroes.rb'
require_relative 'Error.rb'

class Game
	attr_accessor :hero_pool, :player1, :player2, :player1_name, :player2_name, :selected_hero, :selected_spell, :selected_enemy_hero, :current_input, :effect
	attr_reader :invoked
	def initialize
		@invoked = false
		@hero_pool = [Luna.new, Juggernaut.new, Lich.new, Riki.new]
		@player1 = []
		@player2 = []
		@effect = ""
		@error = Error.new
	end

	def os
		if OS.windows?
			@a = 'cls'
		else
			@a = 'clear'
		end
	end

	def set_os(os)
		@os = os
		@a = @os
	end

	def player_names
		system(@a)
		print "Enter 1st player name: "
		@player1_name = gets.chomp

		system(@a)
		print "Enter 2nd player name: "
		@player2_name = gets.chomp
		@invoked = true
	end

	def enough_mana?(hero, skill)
		@skill = skill
		case @skill
			when hero.skill1_name
				@mana_to_use = hero.skill1_mana_cost
				if hero.mana - @mana_to_use < 0
					return false
				else 
					return true
				end
			when hero.skill2_name
				@mana_to_use = hero.skill2_mana_cost
				if hero.mana - @mana_to_use < 0
					return false
				else 
					return true
				end
			when hero.skill3_name
				@mana_to_use = hero.skill3_mana_cost
				if hero.mana - @mana_to_use < 0
					return false
				else 
					return true
				end
			when hero.ultimate_name
				@mana_to_use = hero.ultimate_mana_cost
				if hero.mana - @mana_to_use < 0
					return false
				else 
					return true
				end
		end
	end

	def get_skill_desc(hero_name, hero_skill)
		@hero = hero_name
		@skill = hero_skill
		case @skill
			when 1
				puts "#{@hero.skill1_name}:"
				puts @hero.skill1_d
			when 2
				puts "#{@hero.skill2_name}:"
				puts @hero.skill2_d
			when 3
				puts "#{@hero.skill3_name}:"
				puts @hero.skill3_d
			when 4
				puts "#{@hero.skill4_name}:"
				puts @hero.skill4_d
			else
				#Error::no_skill()
		end
	end

	def allocate_heroes
		@counter = 0
		@allocated_hero = @hero_pool[rand(@hero_pool.size)]
		while @counter < 2
			if @player1.include?(@allocated_hero)
				@allocated_hero = @hero_pool[rand(@hero_pool.size)]
			else
				@player1 << @allocated_hero
				@hero_pool.delete(@allocated_hero)
				@counter += 1
			end

			if @counter == 2
				@counter = 0
				break
			end
		end

		while @counter < 2
			if @player2.include?(@allocated_hero) or @player1.include?(@allocated_hero)
				@allocated_hero = @hero_pool[rand(@hero_pool.size)]
			else
				@player2 << @allocated_hero
				@hero_pool.delete(@allocated_hero)
				@counter += 1
			end

			if @counter == 2
				@counter = 0
				break
			end
		end
	end

	def game_begin
		system(@a)
		if @invoked == false
			@player1_name = "Player1"
			@player2_name = "Player2"
		end
		print "#{@player1_name}'s Heroes are:\n"
		@player1.each {|d| print "Name: #{d.name}, Hp: #{d.hp}, Mana: #{d.mana}|\n"}
		puts
		print "#{@player2_name}'s heroes are:\n"
		@player2.each {|d| print "Name: #{d.name}, Hp: #{d.hp}, Mana: #{d.mana}|\n"}
		puts
	end

	def current_hero_status
		system(@a)
		if @invoked == false
			@player1_name = "Player1"
			@player2_name = "Player2"
		end
		puts "#{player1_name}'s heroes: "
		@player1.each {|d| print "Name: #{d.name}, Hp: #{d.hp}, Mana: #{d.mana}|\n"}
		puts

		puts "#{player2_name}'s heroes: "
		@player2.each {|d| print "Name: #{d.name}, Hp: #{d.hp}, Mana: #{d.mana}|\n"}
		puts
	end

	def check_hero_for_mana(hero)
		@hero = hero
		@ready = []
		for i in 0..@hero.skills.size - 1
			if enough_mana?(@hero, @hero.skills[i])
				@ready << true
			else
				@ready << false
			end
		end
		if @ready.include?(true)
			#puts "yes"
			return true
		else
			return false
		end	
	end

	def select_hero(player)
		system(@a)
		current_hero_status()
		print "Choose a hero to attack with: "
		player.each {|hero| print "#{hero.name} "}
		print "\n"
		@selected_hero = gets.chomp.capitalize
		case @selected_hero
			when player[0].name
				@selected_hero = player[0]
				if !check_hero_for_mana(@selected_hero)
					@error.hero_out_of_mana(@selected_hero)
					select_hero(player)
				end
				if @selected_hero.dead?
					system(@a)
					puts "Error: The hero is already dead."
					sleep(2)
					select_hero(player)
				end
				@current_input = "Your input - Hero: #{@selected_hero.name}"
			when player[1].name
				@selected_hero = player[1]
				if !check_hero_for_mana(@selected_hero)
					@error.hero_out_of_mana(@selected_hero)
					select_hero(player)
				end
				if @selected_hero.dead?
					system(@a)
					puts "Error: The hero is already dead."
					sleep(2)
					select_hero(player)
				end
				@current_input = "Your input - Hero: #{@selected_hero.name}"
			else
				system(@a)
				puts "Error: No such hero." 
				sleep(2)
				select_hero(player)
		end
	end

	def select_enemy_hero(player)
		system(@a)
		current_hero_status()
		puts @current_input
		puts
		print "Choose the enemy hero you wish to attack: "
		player.each {|hero| print "#{hero.name} "}
		puts
		@user_input = gets.chomp.capitalize
		case @user_input
			when player[0].name
				@selected_enemy_hero = player[0]
				if @selected_enemy_hero.dead?
					system(@a)
					puts "Error: The hero is already dead."
					sleep(2)
					select_enemy_hero(player)
				end
				@current_input = @current_input + " Hero to attack: #{@selected_enemy_hero.name}"
			when player[1].name
				@selected_enemy_hero = player[1]
				if @selected_enemy_hero.dead?
					system(@a)
					puts "Error: The hero is already dead."
					sleep(2)
					select_enemy_hero(player)
				end
				@user_input = @user_input + " Hero to attack: #{@selected_enemy_hero.name}"
			else
				system(@a)
				puts "Error: No such hero."
				sleep(2)
				select_enemy_hero(player)
		end
	end

	def heroes_mana?(hero_pool)
		@ok = []
		hero_pool.each do |hero|
			if check_hero_for_mana(hero)
				@ok << true
			else
				@ok << false
			end
		end
		#puts @ok
		if @ok.include?(true)
			return true
		else
			return false
		end
	end

	def select_spell
		system(@a)
		current_hero_status()
		puts @current_input
		puts
		puts "Select a spell to attack with:\n"
		for i in 0..@selected_hero.skills.size - 1
			puts "#{@selected_hero.skills[i]}: #{@selected_hero.skills_d[i]}"
			print "\n"
		end
		@user_input = gets.chomp.split.map(&:capitalize).join(' ')
		puts @user_input
		case @user_input
			when @selected_hero.skill1_name 
				if enough_mana?(@selected_hero, @selected_hero.skill1_name)
					@selected_spell = @selected_hero.skill1_name
					@current_input = @current_input + " Skill: #{@selected_spell}"				
					if @selected_hero.skill1_effect == "ST"
						@effect = "ST"
					elsif @selected_hero.skill1_effect == "AOE"
						@effect = "AOE"
					elsif @selected_hero.skill1_effect == "HEAL"
						@effect = "Heal"
					end
				else
					@error.hero_out_of_mana(@selected_hero)
					select_spell()
				end
			when @selected_hero.skill2_name
				if enough_mana?(@selected_hero, @selected_hero.skill2_name)
					@selected_spell = @selected_hero.skill2_name
					@current_input = @current_input + " Skill: #{@selected_spell}"
					if @selected_hero.skill2_effect == "ST"
						@effect = "ST"
					elsif @selected_hero.skill2_effect == "AOE"
						@effect = "AOE"
					elsif @selected_hero.skill2_effect == "HEAL"
						@effect = "Heal"
					end
				else
					@error.hero_out_of_mana(@selected_hero)
					select_spell()
				end
			when @selected_hero.skill3_name
				if enough_mana?(@selected_hero, @selected_hero.skill3_name)
					@selected_spell = @selected_hero.skill3_name
					@current_input = @current_input + " Skill: #{@selected_spell}"
					if @selected_hero.skill3_effect == "ST"
						@effect = "ST"
					elsif @selected_hero.skill3_effect == "AOE"
						@effect = "AOE"
					elsif @selected_hero.skill3_effect == "HEAL"
						@effect = "Heal"
					end
				else
					@error.hero_out_of_mana(@selected_hero)
					select_spell()
				end
			when @selected_hero.ultimate_name
				if enough_mana?(@selected_hero, @selected_hero.ultimate_name)
					@selected_spell = @selected_hero.ultimate_name
					@current_input = @current_input + " Skill: #{@selected_spell}"
					if @selected_hero.ultimate_effect == "ST"
						@effect = "ST"
					elsif @selected_hero.ultimate_effect == "AOE"
						@effect = "AOE"
					elsif @selected_hero.ultimate_effect == "HEAL"
						@effect = "Heal"
					end
				else
					@error.hero_out_of_mana(@selected_hero)
					select_spell()
				end
			else
				@error.no_spell()
				select_spell()
		end
	end

	def hero_kill(hero)
		@hero = hero
		puts "#{@hero.name} is dead."
		@hero.hp = "DEAD"
		@hero.mana = 0
		@hero.dead = true
		sleep(1)
	end

	def heal(player)
		print "Choose the hero you wish to heal:\n"
		player.each do |hero|
			puts hero.name
		end
		@selected_hero = gets.chomp.capitalize
	end

	def attack(player, enemy_player)
		@enemy_player = enemy_player
		case @selected_spell
			when @selected_hero.skill1_name
				if @effect == "ST"
					@selected_hero.skill1(@selected_enemy_hero)
					if @selected_enemy_hero.hp <= 0
						hero_kill(@selected_enemy_hero)
					end
				elsif @effect == "AOE"
					@selected_hero.skill1(@enemy_player)
					@enemy_player.each do |a|
						if a.hp != 'DEAD'
							if a.hp <= 0
								hero_kill(a)
							end
						end
					end
				end
			when @selected_hero.skill2_name
				if @effect == "AOE"
					@selected_hero.skill2(@enemy_player)
					@enemy_player.each do |a|
						if a.hp != 'DEAD'
							if a.hp <= 0
								hero_kill(a)
							end
						end
					end
				elsif @effect == "ST"
					@selected_hero.skill2(@selected_enemy_hero)
					if @selected_enemy_hero.hp <= 0
						hero_kill(@selected_enemy_hero)
					end
				end
			when @selected_hero.skill3_name
				if @effect == "ST"
					@selected_hero.skill3(@selected_enemy_hero)
					if @selected_enemy_hero.hp <= 0
						hero_kill(@selected_enemy_hero)
					end
				elsif @effect == "AOE"
					@selected_hero.skill13(@enemy_player)
					@enemy_player.each do |a|
						if a.hp != 'DEAD'
							if a.hp <= 0
								hero_kill(a)
							end
						end
					end
				end
			when @selected_hero.ultimate_name
				if @effect == "ST"
					@selected_hero.skill3(@selected_enemy_hero)
					if @selected_enemy_hero.hp <= 0
						hero_kill(@selected_enemy_hero)
					end
				elsif @effect == "AOE"	
					@selected_hero.ultimate(@enemy_player)
					@enemy_player.each do |a|
						if a.hp != 'DEAD'
							if a.hp <= 0
								hero_kill(a)
							end
						end
					end
				end
		end
	end

	def turn(player, enemy_player)
		current_hero_status()
		select_hero(player)
		select_spell
		if @effect == "AOE" 
			attack(player, enemy_player)
		elsif @effect == "ST"
			select_enemy_hero(enemy_player)
			attack(player, enemy_player)
		end
	end

	def check_for_loss(player)
		@message = ""
		if player == player1
			@message = "#{@player2_name} has won the game."
		else
			@message = "#{@player1_name} has won the game."
		end

		@counter = 0
		player.each do |hero|
			if hero.dead == true
				@counter += 1
			end
		end

		if @counter == player.size or !heroes_mana?(player)
			puts @message
			return true
		else
			puts @message
			return false
		end
	end
end

class Shop
	def clarity

	end

	def salve 

	end
end