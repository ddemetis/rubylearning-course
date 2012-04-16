def age_in_seconds(seconds)
  minutes = seconds / 60
  hours = minutes / 60
  days = hours / 24
  years = 0
  months = "zero"

# find years
  while days >= 365
     days -= 365
     years += 1
  end
  months = days / 30 if days > 30 
  
  "You are #{years} and #{months} months old" 
end

puts age_in_seconds(979000000)
puts age_in_seconds(2158493738)
puts age_in_seconds(246144023)
puts age_in_seconds(1270166272)
puts age_in_seconds(1025600095)

