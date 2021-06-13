
class Decryption
  attr_reader :encryped_message, :offset, :elements

  def initialize(encryped_message, offset)
    @encryped_message = encryped_message
    @offset = offset
    @elements = ("a".."z").to_a << " "
  end
end
