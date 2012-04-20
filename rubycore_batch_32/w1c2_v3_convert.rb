class Kelvin

	def self.keys
		{ C: "Celsius", F: "Fahrenheit", D: "Delisle", N: "Newton",
			RE: "Reamur", RA: "Rankine", RO: "Romer", K: "Kelvin"
		}
	end

	def self.key?(name)
			keys.has_key?(name)
	end	

	#convert from a target to Kelvin
	def self.from(name,degrees)
		 all_formulas = { 
				C: Proc.new {|degrees| degrees + 273.15},
				F: Proc.new {|degrees|	(degrees + 459.67) * 5 / 9},
				D: Proc.new {|degrees|	(-degrees * 2 / 3) + 373.15},
				N: Proc.new {|degrees| 	degrees * 100 / 33 + 273.15},
				RE: Proc.new {|degrees| 	degrees * 5 / 4 + 273.15},
				RA: Proc.new {|degrees|   degrees * 5 / 9},
				RO: Proc.new {|degrees|	(degrees - 7.5) * 40 / 21 + 273.15}
		}
 		all_formulas[name].call(degrees)
	end

	#convert to a target from a Kelvin temperature
	def self.to(name,degrees)
		 all_formulas = { 
				C: Proc.new {|degrees| degrees - 273.15},
				F: Proc.new {|degrees|	degrees * 9 / 5 - 459.67},
				D: Proc.new {|degrees|	(373.15 - degrees) * 3 / 2},
				N: Proc.new {|degrees| 	(degrees - 273.15) * 33 / 100},
				RE: Proc.new {|degrees| 	(degrees - 273.15) * 4 / 5},
				RA: Proc.new {|degrees|   degrees * 9 / 5},
				RO: Proc.new {|degrees|	(degrees - 273.15) * 21 / 40 + 7.5}
		}
 		all_formulas[name].call(degrees)
	end

	#call the right combination of conversions
	def self.convert(source, target, degrees)
		case 
			when ((source != :K) and (target == :K))
				self.from(source, degrees)
			when ((source == :K) and (target != :K))
				self.to(target, degrees)
			when ((source != :K) and (target != :K))
				kelvin_degrees = self.from(source, degrees)
				self.to(target,kelvin_degrees)
			when (source == target)
				degrees
		end
	end

end

#display the menu and get us back the selection of user
def show_menu
	puts "Please enter [source] [target] [degrees] f.ex F C 98.6"
	puts "[K] kelvin, [C] Celsius, [F] Fahrenheit"
	puts "[D] Delisle, [N] Newton, [RE] Reaumur, [RO] Romer"
	puts "[Quit] to exit program"
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

while (input = show_menu).downcase != "quit"
	source, target, degrees = input.upcase.split(" ")
	source = source.to_sym  if source
	target = target.to_sym  if target
	degrees = degrees.to_f if degrees
	if Kelvin.key?(source) and Kelvin.key?(target) and degrees
			result = Kelvin.convert(source, target, degrees).round(2)
			puts "#{degrees.to_s + source.to_s} degrees = %.2f#{target.to_s} degrees" % result
	else
			puts "Error - Unrecognized input"
			puts 		
	end
end

puts "Goodbye!"
