
class Encryption
  attr_reader :message, :offset, :elements

  def initialize(message)
    @message = message.downcase
    @offset = Offset.new
    @elements = ("a".."z").to_a << " "
  end

  def transform_message
    @message.chars
  end

  def shift(offset)
    @elements.rotate(offset)
  end
end
