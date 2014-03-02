require_relative 'Skills'

puts "Please take a moment and read this.\nThis is very early pre-alpha demo, so, if you dont want any kinds of errors and sudden quits, please follow the rules. If you misspell the name of the skill the enemy will still attack.\nPress 'Enter' to continue"
gets.chomp
system('cls')

puts "Choose hero:\t Juggernaut\t Luna"
hero_name = gets.chomp
hero_name = hero_name.capitalize

main_hero = ""
enemy_hero = ""
if hero_name == 'Juggernaut'
	main_hero = Hero.new("#{hero_name}", 100, 80)
	enemy_hero = Hero.new("Luna", 100, 80)
	system('cls')
elsif hero_name == 'Luna'
	main_hero = Hero.new("#{hero_name}", 100, 80)
	enemy_hero = Hero.new("Juggernaut", 100, 80)
	system('cls')
else
	puts "Error: Please write the name of the hero"
	gets.chomp
	abort()
end
gmod = rand(10)
if gmod == 2
	puts "Oh my god! The enemy hero has entered GodMode. GG, WP."
	enemy_hero.godmode
end
main_hero.print_hero_stats("You hero")
enemy_hero.print_hero_stats("Enemy hero")
puts "\n"

until enemy_hero.hpp <= 0
	print "Choose a spell to attack with:\nLuccent Beam: damage 20-26, mana 10\nBlink Strike: damage 15-21, mana 7\n"
	spell = gets.chomp
	if spell == 'luccent beam'
		if main_hero.manap - 10 < 0
			main_hero.manap = 0
			system('cls')
			puts "You dont have enough mana."
		else
			enemy_hero.hpp = main_hero.luccent_beam(enemy_hero.hpp)
			main_hero.manap = main_hero.manap - 10
			system('cls')
			puts "After Your attack, #{enemy_hero.name} is left with #{enemy_hero.hpp} Health points. Mana left: #{main_hero.manap}"
			puts "\n"
			if enemy_hero.hpp <= 0
				enemy_hero.victory
			end
		end
	elsif spell == 'blink strike'
		if main_hero.manap - 7 < 0
			main_hero.manap = 0
			system('cls')
			puts "You dont have enough mana."
		else
			enemy_hero.hpp = main_hero.blink_strike(enemy_hero.hpp)
			main_hero.manap = main_hero.manap - 7
			system('cls')
			print "After Your attack, #{enemy_hero.name} is left with #{enemy_hero.hpp} Health points. Mana left: #{main_hero.manap}"
			puts "\n"
			if enemy_hero.hpp <= 0
				enemy_hero.victory
			end
		end
	end
	dice = rand(4)
	if dice <= 2
		if enemy_hero.manap - 10 < 0
			enemy_hero.manap = 0
			puts "#{enemy_hero.name}: fuck my team"
		else
			main_hero.hpp = enemy_hero.luccent_beam(main_hero.hpp)
			enemy_hero.manap = enemy_hero.manap - 10
			puts "After the #{enemy_hero.name}'s attack you are left with #{main_hero.hpp} Health points"
			puts "\n"
			if main_hero.hpp <= 0
				main_hero.defeat
			end
		end
	else
		if enemy_hero.manap - 7 < 0
			enemy_hero.manap = 0
			puts "#{enemy_hero.name}: gg wp go next retard team"
		else
			main_hero.hpp = enemy_hero.blink_strike(main_hero.hpp)
			enemy_hero.manap = enemy_hero.manap - 7
			puts "After the #{enemy_hero.name}'s attack you are left with #{main_hero.hpp} health points"
			puts "\n"
			if main_hero.hpp <= 0
				main_hero.defeat
			end
		end	
	end

	puts "\n"
	main_hero.print_hero_stats("Your hero")
	enemy_hero.print_hero_stats("Enemy hero")
	puts "\n"
end
