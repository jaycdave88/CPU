require_relative "../CPU-master/Code/get_user_name.rb"
require_relative "../CPU-master/Code/cpu1.rb"

puts "Please hit 'n' when you are done recording"
user_input=gets.chomp
if user_input == "n"
	require_relative '../CPU-master/Code/get_user_name.rb'
	require_relative '../CPU-master/Code/cpu2.rb'
	`open "/Users/#{$user_name_computer}/Desktop/CPU-master/Database/CPU_RESULTS.txt"`
end

