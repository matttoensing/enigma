
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

  def update(index, num)
    x = index + num
    return (x % 27) if x > 27
    x
  end

  def character(index1, index2)
    if index1 == 0
      @elements[update(index2, offset.a_key)]
    elsif index1 == 1
      @elements[update(index2, offset.b_key)]
    elsif index1 == 2
      @elements[update(index2, offset.c_key)]
    elsif index1 == 3
      @elements[update(index2, offset.d_key)]
    end
  end

  def encrypt
    array = []
    split.each do |groups|
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
    array.join
  end
end
