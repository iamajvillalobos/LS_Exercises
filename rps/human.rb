# frozen_string_literal: true

require_relative 'player'
require_relative 'move'

class Human < Player
  def set_name
    n = ""
    loop do
      print "What's your name? "
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must input a name."
    end

    self.name = n
  end

  def choose
    choice = nil

    loop do
      print 'Choose a move (rock, paper, scissors, lizard, spock): '
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, you must input correct choice."
    end

    self.move = Move.new(choice)
  end
end
