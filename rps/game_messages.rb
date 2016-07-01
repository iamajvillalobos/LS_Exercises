# frozen_string_literal: true

module GameMessages
  GAME_OPTIONS = %w(rock paper scissors lizard spock).freeze

  def welcome_message
    puts "=> Welcome to #{game_title}"
  end

  def game_title
    GAME_OPTIONS.map(&:capitalize).join(' ')
  end

  def goodbye_message
    puts "\n=> Thanks for playing #{game_title}. Goodbye!"
  end

  def display_player_moves(player1, player2)
    puts "=> #{player1.name} plays #{player1.move}"
    puts "=> #{player2.name} plays #{player2.move}"
  end

  def display_winner_message(player)
    puts "\n=> #{player.name} wins the round!"
  end

  def display_no_winner_message
    puts "=> It's a tie!"
  end

  def display_stop_playing_message
    print "\n=> Do you want to stop playing? (y/n): "
  end

  def display_stop_playing_warning
    puts '=> Error! Please enter "y" or "n" only'
  end

  def display_score(human, computer)
    puts "\n=> Human: #{human.score}"
    puts "=> Computer: #{computer.score}"
  end
end
