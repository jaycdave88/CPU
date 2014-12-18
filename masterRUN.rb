require_relative 'get_user_name.rb'
require_relative 'cpu1.rb'

puts "Please hit 'n' when you are done recording"
user_input=gets.chomp
if user_input == "n"
	require_relative 'get_user_name.rb'
	require_relative 'cpu2.rb'
	`open "/Users/#{$user_name_computer}/Desktop/CPU/CPU_RESULTS.txt"`
end

