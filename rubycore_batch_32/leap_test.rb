def leap_year1?(year)
	year = year.to_i
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

def leap_year2?(year)
	year % 4 == 0 &&  year % 100 != 0 || year % 400 == 0
end


leap_years_from_1 = 98.times {|n| n if leap_year1?(n)}
leap_years_from_2 = 100.times {|n| n if leap_year2?(n)}

result = leap_years_from_1 - leap_years_from_2
puts result


