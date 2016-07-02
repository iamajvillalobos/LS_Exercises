# frozen_string_literal: true

require 'pry'

class History
  def initialize
    @move_history = []
  end

  def add(player, move)
    @move_history << [player, move]
  end

  def display_moves
    puts "\n=> Move history:"
    @move_history.each do |history|
      player_name = history[0].capitalize
      move_name = history[1].value.capitalize
      puts "=> #{player_name}: #{move_name}"
    end
  end
end
