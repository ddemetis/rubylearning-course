# puts [12,23,456,123,4579].collect {|item| "#{item} is #{item % 2 == 0? 'even' : 'odd'}"}

class Fixnum
  def is_even_or_odd?
    self % 2 == 0 ? 'even' : 'odd'
  end
end
 
[12,23,456,123,4579].each {|item| puts "#{item} is #{item.is_even_or_odd?}"}

