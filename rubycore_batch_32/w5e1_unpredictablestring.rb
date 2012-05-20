class UnpredictableString < String
  def initialize(string)
    super
  end

  def scramble
    string_size = self.size
    0.upto(string_size - 1) do |i|
      random_char = rand(string_size)
      self[i], self[random_char] = self[random_char], self[i]
    end
    self
  end
end

some_string = UnpredictableString.new('It was a dark and stormy night.')
puts some_string.scramble

