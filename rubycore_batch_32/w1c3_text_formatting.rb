
#adds surrounding empty ntimes spaces to source string
def uniform_spacing(sourcestring,ntimes)
	newstring = ""
	spacing = "     "
	newstring << spacing + (" " * ntimes) + spacing  + "\n"
	sourcestring.each_line do |line|
		newstring << "#{spacing}#{line.chomp}#{spacing}\n"
	end	
	newstring << spacing + (" " * ntimes) + spacing  + "\n"
	return newstring
end

#creates a multiplication table of ntimes, with optional heading and decoration
def multiplication_table (ntimes, heading = '', decorate = false)

	times_table = []
	table_width = 0
	temporary_times_table = []

	# build the table
	ntimes == 0 ? startat = 0 : startat = 1
	startat.upto(ntimes) do |row|
		rows = []
			startat.upto(ntimes) do |column|
				digits_size = (column * ntimes).to_s.size + 1

				# formatting based on every column's max width
				formatting = "%#{digits_size}d"   

				# sum up all rows width
				table_width += digits_size if row < 2  #control line. only count the first line widths and zero line too
				rows[column] = sprintf formatting % (row * column )		  	
			end
		rows << "\n"
		temporary_times_table << rows.join
	end

# create the table
	table_width += 1

	# add heading if true and decorate
	if heading.length > 1
		times_table << heading.center(table_width) + "\n"
	end

	#add top borderline
	times_table << "=" * table_width + "\n" if decorate

	#add main table
	times_table << temporary_times_table

	#add bottom borderline
	times_table << "=" * table_width + "\n" if decorate

	#add decoration and uniform spacing around table
	uniform_spacing(times_table.join, table_width)
end


#main program that runs all methods above

table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20
puts table1
puts
puts table2
puts
puts multiplication_table 2, 'Times to 2', true
puts
puts multiplication_table 1, 'Times to 1', true

puts
puts multiplication_table 0, 'Times to 0', true

