
class Decryption
  attr_reader :encryped_message, :offset, :elements

  def initialize(encryped_message, offset)
    @encryped_message = encryped_message.downcase.chars
    @offset = offset
    @elements = ("a".."z").to_a << " "
  end

  def grouped
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

  def character(index1, index2)
    if index1 == 0
      @elements[update_index_value(index2, @offset.a_key)]
    elsif index1 == 1
      @elements[update_index_value(index2, @offset.b_key)]
    elsif index1 == 2
      @elements[update_index_value(index2, @offset.c_key)]
    elsif index1 == 3
      @elements[update_index_value(index2, @offset.d_key)]
    end
  end

  def decrypt
    array = []
    grouped.each do |groups|
      groups.each_with_index do |char, index1|
        if @elements.include?(char)
          @elements.each_with_index do |element, index2|
            array << character(index1, index2) if char == element
          end
        else
          array << char
        end
      end
    end
    array
  end

  def message_decrypted
    decrypt.join
  end
end
