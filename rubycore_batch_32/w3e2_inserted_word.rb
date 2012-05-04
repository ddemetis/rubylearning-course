
def insert_word(file, target, replacement, reverse)
  replacement, target = target, replacement if reverse
  regexp = Regexp.new(target)
  content = File.read(file).gsub(regexp, replacement)
  File.new(file, "w").write(content)  
end

if ARGV[0] && ARGV[1] && ARGV[2]
	reverse = (ARGV[3] == "false" or not ARGV[3]) ? false : true
	if File.exist?(ARGV[0])
	  insert_word(ARGV[0], ARGV[1], ARGV[2], reverse)
	else
		puts "The filename #{ARGV[0]} cannot be found"
	end
else
  puts "usage: #{$0} <filename> <word> <word to replace> [true|false]"
end
