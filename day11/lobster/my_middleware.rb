module MyMiddleware
	class Hello
		def initialize(app)
			@app = app
		end

		def call(env)
			case env['PATH_INFO']
				when '/'
					@app.call(env)
				when '/hello'
					[200, {"Content-Type" => "text/plain"}, ["Hello from the middleware!"]]
				else
					[404, {"Content-Type" => "text/plain"}, ["Not OK!"]]
			end
		end
	end
end


