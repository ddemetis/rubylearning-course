
# a shell alike prompt
def prompt(str = "[ddemetis@localhost ruby_shell]", prompt_char = "$")
	print "#{str}#{prompt_char} "
	gets.chomp
end

def ruby_shell
	input = ""
	puts "Enter q to quit program"
	until input == "q" 
		input = "#{prompt}"
		system(input)
	end
end


puts "your have entered: #{prompt "Enter something"}"


# ruby_shell


