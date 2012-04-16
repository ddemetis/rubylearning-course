def convert(f)
  celsius = (f - 32) * 5 / 9
  sprintf("%.2f", celsius).to_f.round(2)
end
 
puts convert(98.6) - convert(-40)

