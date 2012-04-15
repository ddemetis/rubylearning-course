class StrReverse
	def call(env)
		req = Rack::Request.new(env)
		str = req.params['text']

		Rack::Response.new.finish do |res|
			res['Content-Type'] = 'text/plain'
			res.status = 200
			str = "#{str.reverse}"
			res.write str
		end
	end
end

run StrReverse.new
