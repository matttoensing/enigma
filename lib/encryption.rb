
class Encryption
  attr_reader :message, :offset, :elements

  def initialize(message)
    @message = message
    @offset = Offset.new
    @elements = Alphabet.new.elements
  end

  def transform_message
    @message.chars
  end
end
