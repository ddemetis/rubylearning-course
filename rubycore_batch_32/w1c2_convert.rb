
#an array of strings containing following: Menu Index, Menu Caption for source corversion
# menu caption for target conversion, block of code (lambda) to execute upon selecting menu item

def choices
  [ 
							[0, "Type 0", "Exit", lambda{|degrees| degrees}],					
							[1, "Fahrenheit", "Celsius", lambda{|degrees| (degrees - 32) * 5 / 9}],
							[2, "Celsius", "Fahrenheit", lambda{|degrees| degrees * 9 / 5 + 32}],
							[3, "Celsius", "Kelvin", lambda{|degrees| degrees + 273.15}],
							[4, "Kelvin", "Celsius", lambda{|degrees|	degrees - 273.15}],
							[5, "Rankine", "Kelvin", lambda{|degrees|   degrees * 5 / 9}],
							[6, "Delisle", "Kelvin", lambda{|degrees|	(-degrees * 2 / 3) + 373.15}],
							[7, "Newton", "Kelvin", lambda{|degrees| 	degrees * 100 / 33 + 273.15}],
							[8, "Reaumur", "Kelvin", lambda{|degrees| 	degrees * 5 / 4 + 273.15}],
							[9, "Romer", "Kelvin", lambda{|degrees|	(degrees - 7.5) * 40 / 21 + 273.15}]
  ]
end


#display the menu and get us back the selection of user
def show_menu
	puts "Please choose one of the following conversion programs:"
	choices.each do |choice|
		puts "[#{choice[0]}] - #{choice[1]} to #{choice[2]}"
	end
	gets.chomp
end


# conversion method that looks up the array above choices and fills up values and call block of code
def call_conversion(selection)
	source = choices[selection][1].downcase
	target = choices[selection][2].downcase

	puts "Please enter degrees in #{source}:"
	input = gets.chomp.to_f
	converted_result = choices[selection][3].call(input).round(2)

	puts "#{input} degrees of #{source} are %.2f degrees of #{target}" % 	converted_result
end

# clear the screen but first
# check for os type. a simpler but not so safe approach (f.ex java platforms)

def clear_screen
	if RUBY_PLATFORM.include?("win32")
		system("cls")
	else
		system("clear")
	end
end

# the main program that calls all of the above methods

clear_screen

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
