class String
  def reverse_words
    new_string = []
    old_string = self.split(/[ \n]/)
    old_string.length.times { new_string.push old_string.pop }
    new_string.join(' ')
  end
end


puts "Hello World! How are you today?\nAll is good! Thanks.".reverse_words
 
