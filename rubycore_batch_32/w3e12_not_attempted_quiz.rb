quiz = [0,0,0,1,0,0,1,1,0,1]
#not_attempted = quiz.count {|c| c == 0}
not_attempted = quiz.count(0)
puts "The number of participants who did not attempt Quiz 1 is #{not_attempted} out of #{quiz.size} total participants."
