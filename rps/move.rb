# frozen_string_literal: true

class Move
  include Comparable
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def <=>(other_move)
    if rock_winner?(other_move) ||
       paper_winner?(other_move) ||
       scissors_winner?(other_move) ||
       lizard_winner?(other_move) ||
       spock_winner?(other_move)
      1
    elsif value == other_move.value
      0
    else
      -1
    end
  end

  def rock?
    @value == 'rock'
  end

  def rock_winner?(other_move)
    (rock? && other_move.scissors?) || (rock? && other_move.lizard?)
  end

  def rock_loser?(other_move)
    (rock? && other_move.paper?) || (rock? && other_move.spock?)
  end

  def paper?
    @value == 'paper'
  end

  def paper_winner?(other_move)
    (paper? && other_move.spock?) || (paper? && other_move.rock?)
  end

  def paper_loser?(other_move)
    (paper? && other_move.lizard?) || (paper? && other_move.scissors?)
  end

  def scissors?
    @value == 'scissors'
  end

  def scissors_winner?(other_move)
    (scissors? && other_move.paper?) || (scissors? && other_move.lizard?)
  end

  def scissors_loser?(other_move)
    (scissors? && other_move.rock?) || (scissors? && other_move.spock?)
  end

  def lizard?
    @value == 'lizard'
  end

  def lizard_winner?(other_move)
    (lizard? && other_move.spock?) || (lizard? && other_move.paper?)
  end

  def lizard_loser?(other_move)
    (lizard? && other_move.rock?) || (lizard? && other_move.scissors?)
  end

  def spock?
    @value == 'spock'
  end

  def spock_winner?(other_move)
    (spock? && other_move.rock?) || (spock? && other_move.scissors?)
  end

  def spock_loser?(other_move)
    (spock? && other_move.paper?) || (spock? && other_move.lizard?)
  end
end
