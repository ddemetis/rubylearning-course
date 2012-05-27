
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
  attr_accessor :sound_file, :name

  def initialize(name, sound_file = 'shape.aif')
    @name = name
    @sound_file = sound_file
  end

  def on_click
    puts "Clicked the #{@name}"
    puts rotate_clockwise
    puts "sending sound file #{play_file} to player"
    puts
  end

  def play_file
    # call the aif_play_file with argument @sound_file
    # return filename you are playing
    @sound_file  
  end

#demonstrating overloading a method
  def rotate_clockwise
    case self
      #in real scenario this would have been different rotating geometry
      when Triangle
        "rotating triangle 360 degrees the #{@name}"
      when Square
        "rotating square 360 degrees the #{@name}"
      when Circle
        "rotating circle 360 degrees the #{@name}"
      when Amoeba
        "the #{@name} is rotating around its point "
      when Shape
        "rotating generic shape 360 degrees the #{@name}"
    end
  end

end

#Inheritance

class Circle < Shape
#method overriding. play an .mp3 instead of .wav
  def play_file
    # call the mp3_play_file with argument @sound_file
    # return filename you are playing
    @sound_file 
  end
end

class Square < Shape
end

class Triangle < Shape
end

class Amoeba < Shape
  def play_file
    # call the hif_play_file with argument @sound_file
    # return filename you are playing
    @sound_file 
  end
end

gui = Gui.new('AddressBook')
gui.get_shape('Window').on_click

gui.add Square.new('Enter Telephone', 'square.aif')
gui.get_shape('Enter Telephone').on_click


gui.add Circle.new('Call','circle.mp3')
gui.get_shape('Call').on_click

gui.add Triangle.new('Hang UP', 'triangle.aif')
gui.get_shape('Hang UP').on_click

gui.add Amoeba.new('Amoeba', 'amoeba.hif')
gui.get_shape('Amoeba').on_click

