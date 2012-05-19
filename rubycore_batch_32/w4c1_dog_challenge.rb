
class Dog
  attr_accessor :teached_tricks, :name

  def initialize(name)
    @name = name
    @teached_tricks = {}
  end

  def teach_trick (method_name, &block)
    @teached_tricks[method_name] = block
  end

  def bark
    puts "Barf! Barf"
  end

  def eat
    puts "yummmm!!!"
  end

  def chase_cat
    puts "Roar!!!"
  end

  def to_s
    @name
  end

  def method_missing(name, &block)
    if @teached_tricks.has_key? name
      trick = @teached_tricks[name]
      instance_eval &trick
    else
      "#{self.to_s} doesn't know how to #{name}."
    end
  end

end



d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
puts
d2=Dog.new('Fido')
puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
puts d2.laugh
puts d.laugh
puts
d3=Dog.new('Stimpy')
puts d3.dance
puts d3.laugh

# >> Lassie is dancing!
# >> Lassie is a smelly doggy!
# >>
# >> Fido doesn't know how to dance!
# >> Fido finds this hilarious!
# >> Lassie doesn't know how to laugh!
# >>
# >> Stimpy doesn't know how to dance!
# >> Stimpy doesn't know how to laugh!
