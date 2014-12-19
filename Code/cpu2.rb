require_relative 'color.rb'
class File_reader

	def initialize
		@file = "/Users/#{$user_name_computer}/Desktop/CPU-master/Database/CPU_info.txt"
		@get_percent = []
	end

	def read_file
		file=File.open(@file,"rb")
		contents_of_parsed_file = file.read
		array=contents_of_parsed_file.split('H')
		array.each do |find_h|
			if find_h.include?("% user")
				find_percent=find_h.match(/.*(?=% user)/)
				@get_percent << find_percent.to_s
			end
		end
		@get_percent.shift
	end	

	def error
		puts "There was NO CPU activity to record, please try running me again for longer.".red
	end

	def sum
		sum = 0
		@get_percent.each do |percent|
			sum += percent.to_f
		end
		File.write("/Users/#{$user_name_computer}/Desktop/CPU-master/Database/CPU_RESULTS.txt","The average CPU usage is: #{(sum!=0) ? (sum / @get_percent.length * 100).round / 100.0 : error}")
	end
end

cpu=File_reader.new
cpu.read_file
cpu.sum