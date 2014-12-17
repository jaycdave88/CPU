
class CPU

	def initialize
		@chrome_file = "GooglePID.txt"
		@safari_file = "SafariPID.txt"
		@google = `pgrep Google > GooglePID.txt`
		@safari = `pgrep Safari > SafariPID.txt`
		@firefox = `pgrep FireFox > FireFoxPID.txt`
	end

	def brower_selector
		browser_selector_UI
		@brower_choice = gets.chomp
		if @brower_choice == "1"
			@brower_choice=@chrome_file
		elsif @brower_choice == "2"
			@brower_choice=@safari_file
		elsif @brower_choice== "3"
			@brower_choice=@firefox
		else
			puts "Error: No File Loaded"
		end
	end

	def browser_selector_UI
		puts "Please pick a number"
		puts "1.Chrome"
		puts "2.Safari"
		puts "3.FireFox"
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
		do script	"cd ~/Desktop && top -pid #{@user_choice} > CPU_info.txt"
		end tell'`
		# end
	end

	# def open_activity_monitor
	# 	puts `osascript -e 'tell application "Activity Monitor" to activate'`
	# end
end

t=CPU.new
t.brower_selector
t.list_first
t.read_file
