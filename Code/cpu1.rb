# require_relative "/CPU/Code/get_user_name.rb"

class CPU

	def initialize
		@chrome_file = "./Database/GooglePID.txt"
		@safari_file = "./Database/SafariPID.txt"
		@firefox_file = "./Database/FireFoxPID.txt"
		@google = `pgrep Google > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/GooglePID.txt`
		@safari = `pgrep Safari > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/SafariPID.txt`
		@firefox = `pgrep fox > /Users/#{$user_name_computer}/Desktop/CPU-master/Database/FireFoxPID.txt`
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
			puts "Error: Please pick a number 1 - 3."
		end
	end

	def browser_selector_UI
		puts "Please pick a number"
		puts "1.Chrome"
		puts "2.Safari"
		puts "3.FireFox"
	end

	def list_first
		p @brower_choice
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
		# end
	end

end

t=CPU.new
t.brower_selector
t.list_first
t.read_file
