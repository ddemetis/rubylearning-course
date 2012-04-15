require 'net/http'

uri = URI('http://satishtalim.github.com/webruby/chapter3.html')

res = Net::HTTP.get_response(uri)
puts res.code # => '200'
puts res.message # => 'OK'


content = Net::HTTP.get(uri)

puts content.scan(/\bthe\b/).count


