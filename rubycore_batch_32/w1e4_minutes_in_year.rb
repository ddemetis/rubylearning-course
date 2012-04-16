days = 365
hours = 24
minutes = 60
total_minutes = days * hours * minutes

puts total_minutes.to_s.gsub(/(\d)(?=\d{3}+(\.\d*)?$)/, '\1,')
