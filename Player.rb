class Player

  attr_accessor :name, :turns_left

  def initialize(name)
    @name = name
    turns_left = 3
  end

end