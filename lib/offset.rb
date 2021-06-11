
class Offset
  attr_reader :values, :key

  def initialize
    @values = ("0".."9").to_a * 5
    @key = values.sample(5)
  end

  def a_key
    num = @key[0..1].join
    num.rjust(0).to_i
  end

  def b_key
    num = @key[1..2].join
    num.rjust(0).to_i
  end

  def c_key
    num = @key[2..3].join
    num.rjust(0).to_i
  end

  def d_key
    num = @key[3..4].join
    num.rjust(0).to_i
  end
end
