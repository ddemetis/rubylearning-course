puts 'HELLO SONNY!'
years = *(1930..1950)
while (input = gets.chomp) != 'BYE'
	case input
		when ''
			puts 'HELLO SONNY! YOU THERE?'
		when input.upcase
			puts "NO, NOT SINCE #{rand(1930..1950)}!"
		else
			puts 'HUH?!SPEAK UP, SONNY!'
	end
end
puts 'FAREWELL SONNY!'
