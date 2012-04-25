#this works on strings only. wont work if you used to_i on string
class String
  def is_numeric?
    Integer self rescue false
  end
end


def leap_years
#	not leap years	1700, 1800, 2100, 2200, 2300, 2500, 2600, 1900, 2005
#leap years 1600, 2000, 2400 
	[1700, 1800, 2100, 2200, 2300, 2500, 2600, 1600, 2000, 2400, 2004,
		1900, 2005, 4, 5, 120, 360, ]
end


# show what must come true for leap year
def leap_year?(year)
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

#this lines fails for years under 400
#	year % 4 == 0 &&  year % 100 == 0 || year % 400 == 0
#	year % 4 == 0 &&  year % 100 == 0 && year % 400 == 0
end
 
def minutes_in_a_year(year)
	days = leap_year?(year.to_i) ? 366 : 365
	hours = 24
	minutes = 60
	total_minutes = days * hours * minutes
	total_minutes.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')
end
 
def read_year(year, is_leap_year)
	"Year #{year} has #{minutes_in_a_year(year)} minutes in the year and is #{is_leap_year ? "leap" : "not"} year."
end

puts "Enter a year: (q to quit, any string else for automatic)"
while (input = gets.chomp) != "q"
	if input.is_numeric?
		is_leap_year = leap_year?(input)
		puts "The year #{input} is #{"not " if not is_leap_year}a leap year."
		puts read_year(input, is_leap_year)
	else
		leap_years.each {|year| puts read_year(year, leap_year?(year));puts }
	end
	puts "Enter another year?: (q to quit)"
end


