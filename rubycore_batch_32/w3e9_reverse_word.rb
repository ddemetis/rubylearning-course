class String
  def reverse_words
    self.split(/[ \n]/).reverse_each.to_a.join(" ")
  end
end


puts "Hello World! How are you today?\nAll is good! Thanks.".reverse_words
 
