
class Encryption
  attr_reader :message, :offset, :elements

  def initialize(message, offset)
    @message = message.downcase.chars
    @offset = offset
    @elements = ("a".."z").to_a << " "
  end

  def split
    @message.each_slice(4).to_a
  end

  def shift(value)
    @elements.rotate(value)
  end
end
