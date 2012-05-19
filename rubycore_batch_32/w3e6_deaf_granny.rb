
@quit_condition = 0

def bye?(input)
  input == 'BYE' ? @quit_condition += 1 : @quit_condition = 0
  @quit_condition == 3
end

def grandmas_response_to(input)
  case input
    when ''
      'HELLO SONNY! YOU THERE?'
    when 'BYE'
      'CANT HEAR YOU SONNY!'
    when input.upcase
      "NO, NOT SINCE #{rand(1930..1950)}!"
    else
      'HUH?!SPEAK UP, SONNY!'
  end
end


puts 'HELLO SONNY!'
until bye?(input = gets.chomp)
  puts grandmas_response_to(input)
end
puts 'FAREWELL SONNY!'

