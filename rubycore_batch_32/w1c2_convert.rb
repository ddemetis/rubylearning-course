def convert_fahrenheit_to_celsius(degrees)
  (degrees - 32) * 5 / 9
end
def convert_celsius_to_fahrenheit(degrees)
  degrees * 9 / 5 + 32
end
def convert_kelvin_to_celsius(degrees)
	degrees - 273.15
end
def convert_celsius_to_kelvin(degrees)
	degrees + 273.15
end
def convert_rankine_to_kelvin(degrees)
  degrees * 5 / 9
end
def convert_romer_to_kelvin(degrees)
	(degrees - 7.5) * 40 / 21 + 273.15
end
def convert_reaumur_to_kelvin(degrees)
	degrees * 5 / 4 + 273.15
end
def convert_newton_to_kelvin(degrees)
	degrees * 100 / 33 + 273.15
end
def convert_delisle_to_kelvin(degrees)
	(-degrees * 2 / 3) + 373.15
end

def choices
  [ 
							[0, "Type 0", "Exit"],					
							[1, "Fahrenheit", "Celsius"],
							[2, "Celsius", "Fahrenheit"],
							[3, "Celsius", "Kelvin"],
							[4, "Kelvin", "Celsius"],
							[5, "Rankine", "Kelvin"],
							[6, "Delisle", "Kelvin"],
							[7, "Newton", "Kelvin"],
							[8, "Reaumur", "Kelvin"],
							[9, "Romer", "Kelvin"],
  ]
end

def show_menu
	puts "Please choose one of the following conversion programs:"
	choices.each do |choice|
		puts "[#{choice[0]}] - #{choice[1]} to #{choice[2]}"
	end
	gets.chomp
end


def call_conversion(selection)
	source = choices[selection][1].downcase
	target = choices[selection][2].downcase

	puts "Please enter degrees in #{source}:"
	input = gets.chomp.to_f
	converted_result = self.send("convert_#{source}_to_#{target}", input).round(2)

	puts "#{input} degrees of #{source} are %.2f degrees of #{target}" % 	converted_result
end


system("clear")

while (input = show_menu) != "0"
	input = input.to_i
	menu_choices = choices
	first = menu_choices.first
	last = menu_choices.last
	if input > first[0] and input <= last[0]  then
			call_conversion(input)
	else
			puts "Unrecognized option. Please select a valid option."		
	end
	puts  # empty line
end

puts "Goodbye!"
