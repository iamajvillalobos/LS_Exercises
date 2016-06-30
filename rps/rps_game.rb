# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'

class RpsGame
  WINNER_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      game_loop
      break if winner?
    end
    display_winner
    display_goodbye_message
  end

  def game_loop
    display_score
    human.choose
    computer.choose
    display_moves
    display_round_winner
    increment_score
    reset_screen
  end

  def reset_screen
    sleep 0.5
    system("clear")
  end

  def display_score
    puts "-" * 10
    puts "Human: #{human.score}"
    puts "Computer: #{computer.score}"
    puts "-" * 10
    puts ""
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper and Scissors!"
  end

  def increment_score
    human.score += 1 if human.move > computer.move
    computer.score += 1 if human.move < computer.move
  end

  def winner?
    human.score == WINNER_SCORE || computer.score == WINNER_SCORE
  end

  def display_round_winner
    if human.move > computer.move
      puts "\n#{human.name} won!".upcase
    elsif human.move < computer.move
      puts "\n#{computer.name} won!".upcase
    else
      puts "\nIt's a tie!".upcase
    end
  end

  def display_goodbye_message
    display_score
    puts "Thank you for playing Rock, Paper and Scissors, goodbye!"
  end

  def display_winner
    if human.score == WINNER_SCORE
      puts "#{human.name} won!".upcase
      puts ""
    elsif computer.score == WINNER_SCORE
      puts "#{computer.name} won!\n".upcase
      puts ""
    end
  end
end

# Start game
RpsGame.new.play
