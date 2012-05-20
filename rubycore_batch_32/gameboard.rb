class GameBoard

  def initialize
    @hits = 0
    @cells = []
    7.times { |time| @cells[time] = false}
  end

  def hit
    @hits += 1 
    hit_result = @hits == 3 ? 'kill' : 'Hit'
    puts hit_result
    hit_result
  end

  def miss
    puts 'Miss'
    'Miss'
  end

  def set_locations_cells(locations)
    locations.each { |location| @cells[location - 1] = true}
  end

  def check_yourself(guess)
    return guess if guess == 'kill'
    return puts 'Miss' if guess.size < 1
    @cells[guess.to_i] ? hit : miss
  end
end
