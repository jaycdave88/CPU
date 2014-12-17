class Username

	def initialize
		@user_name = puts `osascript -e 'tell application "Terminal"
			do script "cd ~/Desktop/CPU && whoami > username.txt"
		end tell'`
		@user_name_file = open(ENV['HOME']+'/Desktop/CPU/username.txt')
	end

	def trying_fix
		@user_name_file="/Users/#{$user_name_computer}/Desktop/CPU/username.txt"
	end

	def testun
		un=File.readlines(@user_name_file)
		$user_name_computer= un.join.chomp
	end

end

un=Username.new
un.testun
un.trying_fix