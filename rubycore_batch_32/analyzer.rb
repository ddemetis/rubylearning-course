#Text analyzer. receive a file and analyze it
class TextAnalyzer
	attr_accessor :charsx, :chars, :lines, :words, :sentences, :paragraphs, :avgwords, :avgsentences
	attr_accessor :spaces, :newlines, :tabs, :cr

	def initialize(file)
		@file = file
		@chars = @charsx = @lines = @words = @sentences = @paragraphs = @avgwords = @avgsentences = 0
		@spaces = @newlines = @tabs = @cr = 0
		
		File.open(@file, "r") do |file|
			all_lines = file.readlines
			@sentences = all_lines.join.split(/[.!?]/).count
			@paragraphs = all_lines.join.split(/\r\n\r\n/).count
			all_lines.each do |line|
				@lines += 1
				@chars += line.size
				@spaces += line.count(" ")
				@tabs += line.count("\t")
				@cr += line.count("\r")
				@words += line.split(" ").count
				@charsx += (@chars - @spaces - @tabs - @cr - @newlines)
			end
			@avgwords = (@words / @sentences || 0 )
			@avgsentences = (@sentences / @paragraphs || 0)
		end
	end

	def analysis(formating = ": %0d")
		puts 
		puts "Analysis of file: #{@file}"
		puts "=" * (18 + @file.size)
		puts "Character count#{formating}" % @chars
		puts "Character count excluding spaces#{formating}" % @charsx
		puts "Line count#{formating}" % @lines
		puts "Word count#{formating}" % @words
		puts "Sentence count#{formating}" % @sentences
		puts "Paragraph count#{formating}" % @paragraphs
		puts "Average number of words per sentence#{formating}" % @avgwords
		puts "Average number of sentences per paragraph#{formating}" % @avgsentences
	end
end

if ARGV[0] &&  File.exist?(ARGV[0])
	analyzer = TextAnalyzer.new ARGV[0]
	analyzer.analysis
else
	puts "Cannot find filename."
  puts "usage: #{$0} <filename>"
end



