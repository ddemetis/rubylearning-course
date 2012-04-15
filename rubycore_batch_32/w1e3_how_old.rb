age_seconds = 979000000

your_age = [age_seconds.to_f, 60, 60 , 24, 365].inject("/")

puts "%.2f" % your_age

