
class Offset
  attr_reader :values, :key, :date

  def initialize
    @values = ("0".."9").to_a * 5
    @key = values.sample(5)
    @date = Time.new.strftime("%d%m%y")
  end

  def square_date
    @date.to_i ** 2
  end

  def last_four_digits
    grouped = square_date.to_s.chars
    integers = grouped.map { |element| element.to_i }
    x = integers[-4..-1]
  end

  def a_key
    num = @key[0..1].join
    num.rjust(0).to_i + last_four_digits[0]
  end

  def b_key
    num = @key[1..2].join
    num.rjust(0).to_i + last_four_digits[1]
  end

  def c_key
    num = @key[2..3].join
    num.rjust(0).to_i + last_four_digits[2]
  end

  def d_key
    num = @key[3..4].join
    num.rjust(0).to_i + last_four_digits[3]
  end
end
