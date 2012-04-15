require 'net/http'

uri = URI('http://rubylearning.com/data/text.txt')
#puts "uri = #{uri.class}"

res = Net::HTTP.get_response(uri)
puts res.code # => '200'
puts res.message # => 'OK'

puts Net::HTTP.get(uri) # => String

