s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

index = 1
s.each_line do |line|
	puts "Line #{index}: #{line}"
	index += 1
end
