# ruby 1.9.2p290 on fedora 17

require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'hpricot'

url = 'http://satishtalim.github.com/webruby/chapter3.html'

def outputs(transportmedia, content)
	puts "#{transportmedia} found #{content.scan(/\bthe\b/).count} times"
end


outputs("net/http", Net::HTTP.get(URI(url)))

outputs("open-uri", open(url).readlines.join)

outputs("hpricot", Hpricot(open(url)).inner_html) 

outputs("Nokogiri", Nokogiri::HTML(open(url)).text)
 
