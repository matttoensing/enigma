
class Alphabet
  attr_reader :elements

  def initialize
    @elements = ("a".."z").to_a
  end

  def add_space
    @elements << " "
  end
end
