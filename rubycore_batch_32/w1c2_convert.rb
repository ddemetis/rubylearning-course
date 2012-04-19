
#an array of strings containing following: Menu Index, Menu Caption for source corversion
# menu caption for target conversion, block of code (lambda) to execute upon selecting menu item

def choices
 [ 
	[0, "Type 0", "Exit", 
		lambda{|degrees| degrees}
	],					
	[1, "Fahrenheit", "Celsius",
		Proc.new {|degrees| (degrees - 32) * 5 / 9}
	],
	[2, "Celsius", "Fahrenheit",
		Proc.new {|degrees| degrees * 9 / 5 + 32}
	],
	[3, "Celsius", "Kelvin",
		Proc.new {|degrees| degrees + 273.15}
	],
	[4, "Kelvin", "Celsius",
		Proc.new {|degrees|	degrees - 273.15}
	],
	[5, "Rankine", "Kelvin",
		Proc.new {|degrees|   degrees * 5 / 9}
	],
	[6, "Delisle", "Kelvin",
		Proc.new {|degrees|	(-degrees * 2 / 3) + 373.15}
	],
	[7, "Newton", "Kelvin",
		Proc.new {|degrees| 	degrees * 100 / 33 + 273.15}
	],
	[8, "Reaumur", "Kelvin",
		Proc.new {|degrees| 	degrees * 5 / 4 + 273.15}
	],
	[9, "Romer", "Kelvin",
		Proc.new {|degrees|	(degrees - 7.5) * 40 / 21 + 273.15}
	]
 ]
end

# conversion method that looks up the array above choices and fills up values and call block of code
def conversion_result(input,degrees)
	choices[input][3].call(degrees)
end

#display the menu and get us back the selection of user
def show_menu
	puts "Please choose one of the following conversion programs:"
	choices.each do |choice|
		puts "[#{choice[0]}] - #{choice[1]} to #{choice[2]}"
	end
	gets.chomp
end

# clear the screen but first check for os type.
def clear_screen
	platforms = [
								[/win32|win64/, "cls"],
								[/linux|bsd|darwin/, "clear"]
							]
	platforms.each do |os|
		system(os[1]) if RUBY_PLATFORM.match os[0]
	end
end


# the main program that calls all of the above methods

clear_screen

while (input = show_menu) != "0"
	input = input.to_i
	menu = choices
	menu_indexes = menu.first[0]..menu.last[0]

	if menu_indexes.include?(input)
		puts "Please enter degrees in #{menu[input][1]}:"
		degrees = gets.to_f
		puts "#{degrees} degrees of #{menu[input][1]} are %.2f degrees of #{menu[input][2]}" % 	conversion_result(input,degrees).round(2)
	else
		puts "Unrecognized option. Please select a valid option."		
	end
	puts
end

puts "Goodbye!"
