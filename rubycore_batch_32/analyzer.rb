#Text analyzer. receive a file and analyze it
class TextAnalyzer
	attr_accessor :charsx, :chars, :lines, :words, :sentences, :paragraphs, :avgwords, :avgsentences

	def initialize(file)
		@file = file
		@chars = @charsx = @lines = @words = @sentences = @paragraphs = @avgwords = @avgsentences = 0

		file = File.new(@file, "r")
			file.each_line do |line|			
				@paragraphs += 1 if line.match(/^\r\n/)
				@lines += 1
				@chars += line.size
				@charsx += line.scan(/\s/).count
				@words += line.split(/ /).count
				@sentences += line.scan(/[\.!?]/).count
			end

			@avgwords = @words / @sentences.to_f
			@avgsentences = @sentences / @paragraphs.to_f

	end

	def analysis(formating = ": %0d")
		<<-CONTENT
			Analysis of file: #{@file }
			#{"=" * (18 + @file.size) }
			Character count#{formating % @chars }
			Character count excluding spaces#{formating % (@chars - @charsx) }
			Line count#{formating % @lines } 
			Word count#{formating % @words }
			Sentence count#{formating % @sentences }
			Paragraph count#{formating % @paragraphs }
			Average number of words per sentence#{": %0.2f" % @avgwords }
			Average number of sentences per paragraph#{": %0.2f" % @avgsentences }
		CONTENT
	end
end

if ARGV[0] &&  File.exist?(ARGV[0])
	analyzer = TextAnalyzer.new ARGV[0]
	puts analyzer.analysis
else
	puts "Cannot find filename."
  puts "usage: #{$0} <filename>"
end



