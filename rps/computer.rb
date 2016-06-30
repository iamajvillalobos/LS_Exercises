# frozen_string_literal: true

require_relative 'player'
require_relative 'move'

class Computer < Player
  def set_name
    self.name = ['Jon Snow', 'Arya Stark', 'Little Finger', 'Cersie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end
