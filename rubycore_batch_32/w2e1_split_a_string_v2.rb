
#splits and prefix a line with a given string
def prefix_lines(s, splitter = "\n", left_gutter = "Line ")
	index = 0
	s.split(splitter).collect do |line|
		"#{left_gutter} #{index += 1}: #{line}"
	end
end

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
#s = IO.readlines("w2e1_sample.txt").flatten.join

puts prefix_lines(s)
