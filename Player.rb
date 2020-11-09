class Player
  attr_reader :name
  attr_accessor :turns_left

  def initialize(name, starting_turns)
    @name = name
    @starting_turns = @turns_left = starting_turns
  end

  def decrement
    @turns_left -= 1
  end

  def is_alive
    if @turns_left > 0
      return true
    else
      return false
    end
  end

  def print_status
    return "#{@name}: #{@turns_left}/#{@starting_turns}"
  end
end
