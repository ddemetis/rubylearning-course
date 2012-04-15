
class MyApp
	def call(env)
		[200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]]
	end
end

