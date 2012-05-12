
quit_condition = []

puts 'HELLO SONNY!'

until quit_condition.size == 3
  input = gets.chomp
  input == 'BYE' ? quit_condition.push('BYE') : quit_condition = []
  case input
    when ''
      puts 'HELLO SONNY! YOU THERE?'
    when 'BYE'
      puts 'CANT HEAR YOU SONNY!'
    when input.upcase
      puts "NO, NOT SINCE #{rand(1930..1950)}!"
    else
      puts 'HUH?!SPEAK UP, SONNY!'
  end
end
puts 'FAREWELL SONNY!'
