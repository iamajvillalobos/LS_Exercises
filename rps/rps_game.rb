# frozen_string_literal: true

require_relative 'human'
require_relative 'computer'
require_relative 'game_messages'
require_relative 'history'

class RpsGame
  include GameMessages
  attr_accessor :human, :computer
  WINNER_SCORE = 2

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new
  end

  def play
    welcome_message
    game_loop
    goodbye_message
    show_history
  end

  def game_loop
    loop do
      system("clear")
      player_take_turns
      display_player_moves(human, computer)
      evaluate_round
      display_score(human, computer)
      break if winner? || stop_playing?
    end
  end

  def player_take_turns
    human_turn
    computer_turn
  end

  def human_turn
    move = human.choose
    @history.add(human.name.to_s, move)
  end

  def computer_turn
    move = computer.choose
    @history.add(computer.name.to_s, move)
  end

  def evaluate_round
    if human.move > computer.move
      declare_winner(human)
    elsif human.move < computer.move
      declare_winner(computer)
    else
      display_no_winner_message
    end
  end

  def declare_winner(player)
    display_winner_message(player)
    player.score += 1
  end

  def winner?
    human.score == WINNER_SCORE || computer.score == WINNER_SCORE
  end

  def stop_playing?
    choice = ""
    loop do
      display_stop_playing_message
      choice = gets.chomp.downcase
      break if ['y', 'n'].include?(choice)
      puts "=> You must choose y or n."
    end
    return true if choice == 'y'
    false
  end

  def show_history
    @history.display_moves
  end
end

RpsGame.new.play
