
class Player
  attr_reader :lives, :name
  
  def initialize(name)
    @lives = 3
    @name = name
  end

  def got_it_wrong
    @lives -= 1
  end

end
