require 'logger'

rack_time = Proc.new { |env| [200, {"Content-Type" => "text/plain"}, ["Hello. The time is #{Time.now}"]] }
rack_app = Rack::Builder.new do
	use Rack::CommonLogger
	Logger.new('rack.log')
	map "/" do
	  run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This is public page"]] }
  end

  map "/secret" do
    use Rack::Auth::Basic, "Restricted Area" do |user, password|
      user == 'super' && password == 'secretsauce'
    end

    map "/" do
      run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["This is a secret page"]] }
    end

    map "/files" do  #accessed as /secret/files
      run Proc.new {|env| [200, {"Content-Type" => "text/html"}, ["Here are the secret files"]] }
    end
  end
  run rack_time
end
Rack::Handler::Thin.run rack_app, :Port => 9292

