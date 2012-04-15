# gem install mongo bson_ext

require 'mongo'

#conn = Mongo::Connection.new
#db = conn.db("rubylearning")

db = Mongo::Connection.new('flame.mongohq.com', 27051).db("reservationPMS")
auth = db.authenticate('alexia', 'alexia')

#db = Mongo::Connection.new.db("rubylearning")
#db = Mongo::Connection.new("localhost").db("rubylearning")
#db = MOngo::Connection.new("localhost", 48467).db("rubylearning")

db.collection_names.each {|name| puts name}

coll = db.collection("students")

doc = {:name => 'Manisha', :dob => Time.now, :loves => ['english', 'marathi'], :weight => 62, :gender => 'f', :county => 'india'}

coll_id = coll.insert(doc)
coll.update({:_id => coll_id}, '$set' => {:weight => 60})



