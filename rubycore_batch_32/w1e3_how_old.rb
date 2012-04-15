age_seconds = 979000000

seconds = 60 
minutes = 60
hours = 24
days = 365


your_age = [age_seconds.to_f, seconds, minutes , hours, days].inject("/")

puts "%.2f" % your_age

