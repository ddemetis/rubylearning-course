days = 365
hours = 24
minutes = 60
totalminutes = days * hours * minutes

puts totalminutes.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')
