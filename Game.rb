class Game

  def initialize(diff)
    @turn = 0 # Odd = Player 1 turn, Even = Player 2 turn
    @max = diff == 'e' ? 10 : 100 # Defines maximum number that will appear in math questions
    run_game
  end

  def run_game
    get_player_names
    puts "Starting game between #{@pl1.name} and #{@pl2.name}"
  end

  def get_player_names
    puts "Player 1's name: "
    print "> "
    @pl1 = Player.new($stdin.gets.strip)
    puts "Player 1's name: "
    print "> "
    @pl2 = Player.new($stdin.gets.strip)
  end

  def whose_turn
    if (turn % 2 == 1)
      return 1
    else return 2
    end
  end

  def run_question
    num1 = generate_random_num
    num2 = generate_random_num
    correct = num1 + num2
    puts "What does #{num1} plus #{num2} equal?"
    print "> "
    res = $stdin.gets.strip
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
    return (rand * 100).floor
  end
end