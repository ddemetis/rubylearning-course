def mtdarry
	begin
	  mytimes = 10.times do |num|
			if num == 5 then 
#				raise StandardError
			end
		end
	rescue StandardError
		puts "i got error"
		return mytimes.class
	end
end
 
#mtdarry

puts mtdarry
