require_relative "./Code/color.rb"
require_relative "./Code/cpu1.rb"
puts "Please hit 'n' when you are done recording".background_blue.white
user_input=gets.chomp
if user_input == "n"
	require_relative './Code/cpu2.rb'

		`open "/Users/#{$user_name_computer}/Desktop/CPU-master/Database/CPU_RESULTS.txt"`
	
end

