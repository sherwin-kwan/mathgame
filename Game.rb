class Game

  STARTING_TURNS = 3

  def initialize(diff)
    @turn = 0 # Odd = Player 1 turn, Even = Player 2 turn
    @max = diff == 'e' ? 10 : 100 # Defines maximum number that will appear in math questions
    puts "Max is #{@max}"
    run_game
  end

  def run_game
    get_player_names
    p @pl1
    p @pl2
    puts "Starting game between #{@pl1.name} and #{@pl2.name}"
    while (@pl1.turns_left > 0 && @pl2.turns_left > 0)
      @turn += 1
      run_question
      puts "#{@pl1.name}: #{@pl1.turns_left}/#{STARTING_TURNS} / #{@pl2.name}: #{@pl2.turns_left}/#{STARTING_TURNS}"
    end
    fancy_print("GAME OVER")
    puts "After #{@turn} turns, #{whose_turn(@turn+1).name} has won the game!"
    puts "FINAL: #{@pl1.name}: #{@pl1.turns_left}/#{STARTING_TURNS} / #{@pl2.name}: #{@pl2.turns_left}/#{STARTING_TURNS}"
    puts "Goodbye!"
  end

  def fancy_print(str)
    print "\n" + "-" * 5
    print "   #{str}   "
    print "-" * 5
  end

  def get_player_names
    puts "Player 1's name: "
    print "> "
    @pl1 = Player.new($stdin.gets.strip, STARTING_TURNS)
    puts "Player 2's name: "
    print "> "
    @pl2 = Player.new($stdin.gets.strip, STARTING_TURNS)
  end

  def whose_turn(turn)
    if (turn % 2 == 1)
      return @pl1
    else return @pl2
    end
  end

  def run_question # Do we still have to pass variables? OR use them from the class?
    fancy_print("NEW TURN")
    num1 = generate_random_num
    num2 = generate_random_num
    active_player = whose_turn(@turn)
    correct = num1 + num2
    puts "\n#{active_player.name}, What does #{num1} plus #{num2} equal?"
    print "> "
    res = $stdin.gets.strip.to_i
    if correct == res
      puts "Congrats #{active_player.name}, that is correct!"
    else
      puts "Sorry #{active_player.name}, you may wish to review your primary school math."
      active_player.turns_left -= 1
    end
  end

  # def generate_operation
  #   op = rand * 4
  #   case op
  #   when 0...1
  #     return Proc.new{|a, b| a + b}
  #   when 1...2
  #     return Proc.new{|a, b| a - b}
  #   when 2...3
  #     return Proc.new{|a, b| a * b}
  #   when 3...4
  #     return Proc.new{|a, b| a / b}
  #   else
  #     raise StandardError.new "Random number generator failed for unknown reasons"
  #   end
  # end

  def generate_random_num
    return (rand * @max).floor
  end
end