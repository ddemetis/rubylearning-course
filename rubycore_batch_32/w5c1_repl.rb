def prompt(str = "[irb-repl]", prompt_char = "$")
	print "#{str}#{prompt_char} "
	gets.chomp
end

def irb_repl
	input = ""
	puts "Enter q to quit program"
	until input == "q" 
		input = "#{prompt}"
    begin
		  p eval(input)
    rescue
      puts "Syntax error"
    end
	end
end

irb_repl


require 'erb'

x = 42
template = ERB.new <<-EOF
  The value of x is: <%= x %>
EOF
puts template.result(binding)
