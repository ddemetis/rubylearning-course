def even_or_odd?(item)
  item % 2 == 0 ? 'even' : 'odd'
end 
 
[12,23,456,123,4579].each {|item| puts "#{item} is #{even_or_odd?(item)}"}

