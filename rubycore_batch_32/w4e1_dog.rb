class Dog
  def initialize(name)
    @name = name
  end

  def bark
    puts "Barf! Barf"
    self
  end

  def eat
    puts "yummmm!!!"
    self
  end

  def chase_cat
    puts "Roar!!!"
    self
  end

  def to_s  #thanks alex
    @name
  end
end


d = Dog.new('Leo')

d.eat.bark.chase_cat

