# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'

class RpsGame
  WINNER_SCORE = 3
  GAME_OPTIONS = %w(rock paper scissors lizard spock).freeze
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
    display_history
    display_goodbye_message
  end

  def game_loop
    human_turn
    computer_turn
    display_moves
    display_round_winner
    increment_score
    reset_screen
    display_score
  end

  def human_turn
    move = human.choose
    human.history << move.to_s
  end

  def computer_turn
    move = computer.choose
    computer.history << move.to_s
  end

  def display_history
    human_history
    computer_history
  end

  def human_history
    puts "#{human.name} moves:"
    puts "-" * 10
    human.history.each { |move| puts move.to_s }
  end

  def computer_history
    puts "\n#{computer.name} moves:"
    puts "-" * 10
    computer.history.each { |move| puts move.to_s }
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
    puts "Welcome to #{capitalize_game_title}!"
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
      human_won_message
    elsif human.move < computer.move
      computer_won_message
    else
      puts "\nIt's a tie!".upcase
    end
  end

  def human_won_message
    puts "\n#{human.name} won!".upcase
  end

  def computer_won_message
    puts "\n#{computer.name} won!".upcase
  end

  def display_goodbye_message
    puts "\nThank you for playing #{capitalize_game_title}, goodbye!"
  end

  def capitalize_game_title
    GAME_OPTIONS.map(&:capitalize).join(' ')
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
