class Rectangle
  attr_accessor :x, :y, :formatted
  def initialize(x, y, formatted = false)
    @x = x
    @y = y
    @formatted = formatted
  end

  def area
    format(x * y)
  end

  def perimeter
#    format(2 * x + 2 * y)
    formatted ? ("%0.2f" % (2 * x + 2 * y)).round(2) : (2 * x + 2 * y)
  end

  def format(value)
    formatted ? ("%0.2f" % value).round(2) : value 
  end

  def to_s
    "#{x}, #{y}"
  end
end


r = Rectangle.new(23.45, 34.67)
puts "Area is = #{r.area()}"
puts "Perimeter is = #{r.perimeter}"

r.formatted = true
puts "The rectangle with sides of #{r} has a"
puts "perimeter of #{r.perimeter} and an area of #{r.area}"

