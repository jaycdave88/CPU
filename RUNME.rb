require_relative "../CPU/Code/get_user_name.rb"
require_relative "../CPU/Code/cpu1.rb"

puts "Please hit 'n' when you are done recording"
user_input=gets.chomp
if user_input == "n"
	require_relative '../CPU/Code/get_user_name.rb'
	require_relative '../CPU/Code/cpu2.rb'
	`open "/Users/#{$user_name_computer}/Desktop/CPU/Database/CPU_RESULTS.txt"`
end

