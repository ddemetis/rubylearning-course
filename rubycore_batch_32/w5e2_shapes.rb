
class Gui
  attr_accessor :shapes, :title
  def initialize(title)
    @title = title
    @shapes = [Shape.new('Window')]
  end
  
  def add(shape)
    @shapes << shape
  end

  def get_shape(shape_name)
    shapes = @shapes.select { |shape| shape.name == shape_name }
    shapes.first
  end
end

#class to be inherited
class Shape
  attr_accessor :aif_sound_file, :name

  def initialize(name)
    @name = name
    @aif_sound_file = 'shape.wav'
  end

  def on_click
    rotate_clockwise
    play_file
  end

  def play_file
    puts "playing sound file #{@aif_sound_file} of the shape #{@name}"
  end

#demonstrating overloading a method
  def rotate_clockwise
    case self
      #in real scenario this would have been different rotating geometry
      when Triangle
        puts "rotating triangle 360 degrees the #{@name}"
      when Square
        puts "rotating square 360 degrees the #{@name}"
      when Circle
        puts "rotating circle 360 degrees the #{@name}"
      when Shape
        puts "rotating generic shape 360 degrees the #{@name}"
    end
  end

end

#Inheritance

class Circle < Shape
  def initialize(name)
    @aif_sound_file = 'circle.mp3'
    super
  end

#method overriding. play an .mp3 instead of .wav
  def play_file
    puts "playing mp3 file this time #{@aif_sound_file}"
  end

end

class Square < Shape
  def initialize(name)
    @aif_sound_file = 'square.wav'
    super
  end

end

class Triangle < Shape
  def initialize(name)
    @aif_sound_file = 'triangle.wav'
    super
  end

end


gui = Gui.new('AddressBook')
gui.add Square.new('Enter Telephone')
gui.add Triangle.new('Hang UP')
gui.add Circle.new('Call')

puts 'Clicking the Square'
gui.get_shape('Enter Telephone').on_click
puts

puts 'Clicking the Circle'
gui.get_shape('Call').on_click
puts

puts 'Clicking the Triangle'
gui.get_shape('Hang UP').on_click
puts
