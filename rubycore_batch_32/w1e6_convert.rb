def convert(f)
  (f - 32) * 5 / 9
end
 
puts "%.2f" % (convert(98.6) - convert(-40).round(2))

