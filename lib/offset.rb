require 'date'

class Offset
  attr_reader :key, :date

  def initialize(key = random_number_generator, date = todays_date)
    @key = key
    @date = date
  end

  def random_number_generator
    (("0".."9").to_a * 5).sample(5).join
  end

  def todays_date
    Date.today.strftime("%d%m%y")
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
    x = num.rjust(0).to_i + last_four_digits[0]
    return (x % 27) if x > 27
    x
  end

  def b_key
    num = grouped_key[1..2].join
    x = num.rjust(0).to_i + last_four_digits[1]
    return (x % 27) if x > 27
    x
  end

  def c_key
    num = grouped_key[2..3].join
    x = num.rjust(0).to_i + last_four_digits[2]
    return (x % 27) if x > 27
    x
  end

  def d_key
    num = grouped_key[3..4].join
    x = num.rjust(0).to_i + last_four_digits[3]
    return (x % 27) if x > 27
    x
  end
end

# = (("0".."9").to_a * 5).sample(5)
# = Time.new.strftime("%d%m%y")
