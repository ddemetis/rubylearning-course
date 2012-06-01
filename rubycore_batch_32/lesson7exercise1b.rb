require_relative 'lesson7exercise1'  

my_klass = Klass.new('Hello Rubyist')

File.open('lesson7file', 'w+') do |f|  
  Marshal.dump(my_klass, f)  
end 

File.open('lesson7file') do |f|  
  @restored_klass = Marshal.load(f)  
end

puts @restored_klass.say_hello

