require_relative 'dog'

class Bulldog < Dog
  def swim
    "can't swim"
  end
end

kim = Bulldog.new
puts kim.speak
puts kim.swim
