class Player

  attr_accessor :name, :turns_left

  def initialize(name, starting_turns)
    @name = name
    @turns_left = starting_turns
  end

end