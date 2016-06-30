# frozen_string_literal: true

class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def >(other_move)
    (rock? && other_move.scissors?) || (rock? && other_move.lizard?) ||
      (paper? && other_move.spock?) || (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?) || (scissors? && other_move.lizard?) ||
      (spock? && other_move.rock?) || (spock? && other_move.scissors?) ||
      (lizard? && other_move.spock?) || (lizard? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) || (rock? && other_move.spock?) ||
      (paper? && other_move.lizard?) || (paper? && other_move.scissors?) ||
      (lizard? && other_move.rock?) || (lizard? && other_move.scissors?) ||
      (spock? && other_move.paper?) || (spock? && other_move.lizard?) ||
      (scissors? && other_move.rock?) || (scissors? && other_move.spock?)
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

  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end
end
