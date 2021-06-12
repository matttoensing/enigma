
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

  def encrypt
    array = []
    split.each do |groups|
      groups.each_with_index do |char, index1|
        @elements.each_with_index do |element, index2|
          if char == element && index1 == 0
            array << @elements[update(index2, offset.a_key)]
          elsif char == element && index1 == 1
            array << @elements[update(index2, offset.b_key)]
          elsif char == element && index1 == 2
            array << @elements[update(index2, offset.c_key)]
          elsif char == element && index1 == 3
            array << @elements[update(index2, offset.d_key)]
          end
        end
      end
    end
    array
  end
end
