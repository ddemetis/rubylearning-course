require 'rack'

#my_proc = lambda { |env| [200, {"Content-Type" => "text/plain"},["Command line argument you typed was: #{env}"]]}
# puts my_proc.call(ARGV[0])


#def my_rack_proc(env)
#	[200, {"Content-Type" => "text/plain"},["Command line argument you typed was: #{env}"]]
#end
#Rack::Handler::WEBrick.run method(:my_rack_proc), :Port => 8500

my_rack_proc = lambda do |env|
 [200, {"Content-Type" => "text/plain"}, ["Command line argument you typed was: #{ARGV[0]}"]] 
end
Rack::Handler::WEBrick.run my_rack_proc, :Port => 8500



