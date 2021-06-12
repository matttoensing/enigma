
class Offset
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def square_date
    @date.to_i ** 2
  end

  def last_four_digits
    grouped = square_date.to_s.chars
    integers = grouped.map { |element| element.to_i }
    x = integers[-4..-1]
  end

  def grouped_key
    @key.chars
  end

  def a_key
    num = grouped_key[0..1].join
    num.rjust(0).to_i + last_four_digits[0]
  end

  def b_key
    num = grouped_key[1..2].join
    num.rjust(0).to_i + last_four_digits[1]
  end

  def c_key
    num = grouped_key[2..3].join
    num.rjust(0).to_i + last_four_digits[2]
  end

  def d_key
    num = grouped_key[3..4].join
    num.rjust(0).to_i + last_four_digits[3]
  end
end

# = (("0".."9").to_a * 5).sample(5)
# = Time.new.strftime("%d%m%y")
