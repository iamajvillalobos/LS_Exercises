# frozen_string_literal: true

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Computer < Player
  def set_name
    self.name = ['Jon Snow', 'Arya Stark', 'Little Finger', 'Cersie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must input a name."
    end

    self.name = n
  end

  def choose
    choice = nil

    loop do
      puts 'Choose a move (rock, paper, scissors):'
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, you must input correct choice."
    end

    self.move = Move.new(choice)
  end
end

class RPSGame
  attr_accessor :human, :computer
  WINNER_SCORE = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper and Scissors!"
  end

  def display_goodbye_message
    display_score
    puts "Thank you for playing Rock, Paper and Scissors, goodbye!"
  end

  def display_score
    puts "-" * 10
    puts "Human: #{human.score}"
    puts "Computer: #{computer.score}"
    puts "-" * 10
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.score == WINNER_SCORE
      puts "#{human.name} won!"
    elsif computer.score == WINNER_SCORE
      puts "#{computer.name} won!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Do you want to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
    end

    return true if answer.casecmp("y") == 0
  end

  def increment_score
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def winner?
    human.score == WINNER_SCORE || computer.score == WINNER_SCORE
  end

  def play
    display_welcome_message
    loop do
      display_score
      human.choose
      computer.choose

      display_moves
      increment_score

      sleep 0.5
      system("clear")

      break if winner?
    end
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
