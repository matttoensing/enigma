
class Encryption
  attr_reader :message, :offset, :elements

  def initialize(message)
    @message = message.downcase.chars
    @offset = Offset.new
    @elements = ("a".."z").to_a << " "
  end

  def split
    @message.each_slice(4).to_a
  end

  def number_values
    @elements.each do |element|
      @message.map do |char|
        element.index if element == char
      end
    end
  end

  def shift(offset)
    @elements.rotate(offset)
  end
end
