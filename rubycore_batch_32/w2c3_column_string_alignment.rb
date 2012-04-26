class String
	#prefix the string and number it
	def formatlines(left_gutter = "Line ")
		all_lines = split("\n")
		max_width = all_lines.size.to_s.size
	 	all_lines.each.with_index do |line,index|
			string_format = "#{left_gutter} %0#{max_width}d: " % (index + 1).to_s
			all_lines[index] =  string_format + line
		end
	end
end

class Array
	#prefix the string and number it
	def formatlines(left_gutter = "Line ")
		max_width = size.to_s.size
	 	each.with_index do |line,index|
			string_format = "#{left_gutter} %0#{max_width}d: " % (index + 1).to_s
			self[index] =  string_format + line
		end
	end
end

puts ("test me one thousand times\n" * 1000).formatlines  #for string
#puts ("test me one thousand times\n" * 1000).split("\n").formatlines #for Array
