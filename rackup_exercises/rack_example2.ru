app = proc do |env|
  response = Rack::Response.new
  request = Rack::Request.new(env)
  info = request.params['info']

  if info and info[:tempfile]
    response['Content-Type'] = info[:type]
    response.body = info[:tempfile].readlines.sort
  else
    response['Content-Type'] = 'text/plain'
    response.status = 400
    response.write "info parameter must be a file uplad"
  end

  response.finish
end

run app



# Usage:
# $ rackup upload.ru

#
# File alpha.txt contains:

# zebra
#yen
#xmas
#birthday
#cat
#apple
#pune
#mumbai
#nashville
#Client:
#$ curl -F "info=@alpha.txt" localhost:9292
#Result:

#apple
#birthday
#cat
#mumbai
#nashville
#pune
#xmas
#yen
#zebra
