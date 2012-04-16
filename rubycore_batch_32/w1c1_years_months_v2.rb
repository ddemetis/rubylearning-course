def age_in_seconds(seconds)
  minutes = seconds / 60
  hours = minutes / 60
  days = hours / 24
  years = 0
  months = 0

  day_count = 0
  month_count = 0

  days.downto(0) do |year|
    years += 1
  end
  
#  months = month_count % 12
#  years = (month_count - months) / 12
  "You are #{years} and #{months} months old" 

end

puts age_in_seconds(979000000)
puts age_in_seconds(2158493738)
puts age_in_seconds(246144023)
puts age_in_seconds(1270166272)
puts age_in_seconds(1025600095)

