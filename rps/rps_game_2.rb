# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'
require_relative 'game_messages'

class RpsGame
  include GameMessages
  attr_accessor :human, :computer
  WINNER_SCORE = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    welcome_message
    game_loop
    goodbye_message
  end

  def game_loop
    loop do
      player_take_turns
      display_player_moves(human, computer)
      evaluate_round
      break unless continue_playing?
    end
  end

  def player_take_turns
    human.choose
    computer.choose
  end

  def evaluate_round
    if human.move > computer.move
      display_winner_message(human)
      human.score += 1
    elsif human.move < computer.move
      display_winner_message(computer)
      computer.score += 1
    else
      display_no_winner_message
    end
  end

  def winner?
  end

  def continue_playing?
    display_play_again_message
    choice = ""
    loop do
      choice = gets.chomp.downcase
      break if ['y', 'n'].include?(choice)
    end
    return true if choice == 'y'
    false
  end
end

RpsGame.new.play
