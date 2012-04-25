def myif(result_true, result_false)
	yield && result_true || result_false
end

#puts 5 > 3 ? "yeah", "boo" #=> nil
#puts 5 < 3 ? "yeah" || "boo" #=> nil

puts myif("year","boo") {5 > 3}
puts myif("year","boo") {5 < 3}


