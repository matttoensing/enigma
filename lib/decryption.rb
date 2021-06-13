
class Decryption
  attr_reader :encryped_message, :offset, :elements

  def initialize(encryped_message, offset)
    @encryped_message = encryped_message.downcase.chars
    @offset = offset
    @elements = ("a".."z").to_a << " "
  end

  def group
    @encryped_message.each_slice(4).to_a
  end

  def shift(value)
    @elements.rotate(value)
  end

  def update_index_value(index, num)
    x = index - num
    return (x % 27) if x < 0
    x
  end
end
