target = "word"
replacement = "inserted word"

def insert_word(file, target, replacement, reverse = false)
  replacement, target = target, replacement if reverse
  regexp = Regexp.new(target)
  content = File.read(file).gsub(regexp, replacement)
  File.new(file, "w").write(content)  
end

if ARGV.length > 0
  insert_word(ARGV[0], target, replacement, ARGV[1])
else
  puts "usage: #{$0} <filename> [true|false]"
end
