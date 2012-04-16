def multiplication_table (ntimes, heading = '', decorate = false)
	times_table = []

# find size of max integer and do analog formatting for sprintf
	digits_for_formatting = (ntimes * ntimes).to_s.size + 1
	formatting = "%" + digits_for_formatting.to_s + "d"
	table_width = ntimes * digits_for_formatting + 2

# add heading if true and decorate
	if heading.length > 1
		times_table << "Time Table to #{ntimes}".center(table_width) + "\n"
	end
	times_table << borderline(table_width, "=") if decorate


# build the table
	1.upto(ntimes ) do |row|
		rows = []
		1.upto(ntimes) do |table_field|
			rows[table_field] = sprintf formatting % (row * table_field )
		end
  	rows << "\n"
		rows.flatten!
		rows.to_s
		times_table << rows
	end

# decorate and uniform spacing around table
	times_table << borderline(table_width, "=") if decorate	
	uniform_spacing(times_table.flatten.join, table_width)

end


def borderline(ntimes, decoration_symbol)
	borderline = ""
	1.upto(ntimes) do
		borderline << decoration_symbol	
	end
	return borderline + "\n"
end

def uniform_spacing(tablestring,ntimes)
	newstring = ""
	spacing = "     "
	newstring << spacing + borderline(ntimes, " ") + spacing + "\n"
	tablestring.each_line do |line|
		newstring << spacing + line + spacing + "\n"
	end	
	newstring << spacing + borderline(ntimes, " ") + spacing + "\n"
	return newstring
end


table1 = multiplication_table 9, 'Times Table to 9', true
table2 = multiplication_table 20

puts table1
puts
puts table2
