s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

s.each_line.with_index do |line,index|
	puts "Line #{index+1}: #{line}"
end
