
def insert_word(file, word_to_insert, target_word)
  word_to_insert = "#{word_to_insert} #{target_word}" unless ARGV[3] == '--replace'
  content = File.read(file).gsub(target_word, word_to_insert )
  File.new(file, "w").write(content)  
end

if ARGV[0] && ARGV[1].length != ' ' && ARGV[2]
	if File.exist?(ARGV[0])
	  insert_word(ARGV[0], ARGV[1], ARGV[2])
	else
		puts "The filename #{ARGV[0]} cannot be found"
	end
else
  puts "Inserts a word in front of another word."
  puts "usage: #{$0} <filename> <word_to_insert> <word_to_insert_in_front_of_it> --replace"
end
