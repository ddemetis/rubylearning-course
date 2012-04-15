def convert(f)
  sprintf("%.2f", (f - 32) * 5 / 9).to_f
end
 
puts convert(98.6) - convert(-40)

