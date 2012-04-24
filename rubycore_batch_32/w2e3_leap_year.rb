def leap_years
#	not leap years	1700, 1800, 2100, 2200, 2300, 2500, 2600, 1900, 2005
#leap years 1600, 2000, 2400 
	[1700, 1800, 2100, 2200, 2300, 2500, 2600, 1600, 2000, 2400, 2000, 2004,
		1900, 2005]
end


# show what must come true for leap year
def leap_year?(year)
	if year % 4 == 0 
		if	year % 100 == 0 
			if year % 400 == 0
				true
			else
				false
			end
		else
			true
		end
	else
		false
	end

end
 
def minutes_in_a_year(year)
	days = leap_year?(year) ? 366 : 365
	hours = 24
	minutes = 60
	total_minutes = days * hours * minutes
	total_minutes.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')
end
 
def validate_and_print(year)
	yes_or_no = leap_year?(year) ? "" : "not "
	puts "The year #{year} is #{yes_or_no}a leap year."
	puts "There are #{minutes_in_a_year(year)} minutes in the year."
	puts
end

puts "Enter a year: (q to quit, auto for automatic)"
while (input = gets.chomp) != "q"
	case input
		when "auto"
			leap_years.each {|year| validate_and_print(year)}
		else
			validate_and_print(input.to_i)
	end
	puts "Enter another year?: (q to quit)"
end


