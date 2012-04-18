
#adds surrounding empty ntimes spaces to source string
def uniform_spacing(sourcestring,ntimes)
	newstring = ""
	spacing = "     "
	newstring << spacing + (" " * ntimes + "\n") + spacing 
	sourcestring.each_line do |line|
		newstring << spacing + line + spacing
	end	
	newstring << spacing + (" " * ntimes + "\n") + spacing 
	return newstring
end

#creates a multiplication table of ntimes, with optional heading and decoration
def multiplication_table (ntimes, heading = '', decorate = false)

	if ntimes == 0 
		return "0 does not have multiplications. Please enter a value of 1 and above"
	end

	times_table = []
	table_width = 0
	temporary_times_table = []



	# build the table
	1.upto(ntimes ) do |row|
		rows = []
			1.upto(ntimes) do |table_field|
				digits_size = (table_field * ntimes).to_s.size + 1

				# formatting based on every column's max width
				formatting = "%" + digits_size.to_s + "d"   

				# sum up all rows width
				table_width += digits_size if row == 1  #control line. only count the first line widths

				rows[table_field] = sprintf formatting % (row * table_field )
			end
  	rows << "\n"
		rows.flatten!
		rows.to_s
		temporary_times_table << rows
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
	uniform_spacing(times_table.flatten.join, table_width)
end


#main program that runs all methods above

table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20, '', true
puts table1
puts
puts table2
puts
puts multiplication_table 2, 'times to 2', true
puts
puts multiplication_table 1, 'times to 1', true

puts
puts multiplication_table 0, 'times to 0', true

