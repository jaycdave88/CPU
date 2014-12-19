require_relative 'color.rb'
class CPU

	def initialize
		@chrome_file = "./Database/GooglePID.txt"
		@safari_file = "./Database/SafariPID.txt"
		@firefox_file = "./Database/FireFoxPID.txt"
		
		@user_name = puts `osascript -e 'tell application "Terminal"
			do script "cd ~/Desktop/CPU-master/Database && whoami > username.txt&exit"
		end tell'`
		@user_name_file = open(ENV['HOME']+'/Desktop/CPU-master/Database/username.txt')
	

		@google = `pgrep Google > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/GooglePID.txt`
		@safari = `pgrep Safari > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/SafariPID.txt`
		@firefox = `pgrep fox > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/FireFoxPID.txt`
	end

	def trying_fix
		@user_name_file="./Users/#{$user_name_computer}/Desktop/CPU-master/Database/username.txt"
	end

	def testun
		un=File.readlines(@user_name_file)
		$user_name_computer= un.join.chomp
	end

	def brower_selector
		browser_selector_UI
		@brower_choice = gets.chomp
		if @brower_choice == "1"
			@brower_choice=@chrome_file
		elsif @brower_choice == "2"
			@brower_choice=@safari_file
		elsif @brower_choice == "3"
			@brower_choice=@firefox_file
		else
			puts "Error: Please pick a number 1 - 3.".red
		end
	end

	def browser_selector_UI
		puts "Please pick a number".background_blue.white
		puts "1.Chrome".background_blue.green
		puts "2.Safari".background_blue.green
		puts "3.FireFox".background_blue.green
	end

	def list_first
		File.open(@brower_choice).each_with_index do |all,index|
			if index == 0
				puts all
			end
		end
	end

	def read_file
		f=File.read(@brower_choice)
		new_line=f.split("\n")
		@user_choice = new_line[0].to_i
		apple_script
	end


	def apple_script
		puts `osascript -e 'tell application "Terminal"
		do script	"cd /Users/#{$user_name_computer}/Desktop/CPU-master/Database/ && top -pid #{@user_choice} > CPU_info.txt"
		end tell'`
	end

end

t=CPU.new
t.brower_selector
t.testun
t.trying_fix
t.list_first
t.read_file
