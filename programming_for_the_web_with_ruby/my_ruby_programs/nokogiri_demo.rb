require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://rubylearning.com/"))

puts "Search with XPath"
puts doc.xpath("//h2[@id='slogan']").first.content


puts "Search with CSS3"
puts doc.css("#footer p strong:first-child")[0].content
