require 'date'

class Offset
  attr_reader :key, :date

  def initialize(key = random_number_generator, date = todays_date)
    @key = key
    @date = date
  end
  # pick a random number from 0- 99999 and stub test before calling offset.new
  # do the same with date and stub before calling Date.new
  def random_number_generator
    rand_num = rand(0..99999).to_s.rjust(0)
    return '0%o' % rand_num if rand_num.length < 4
    rand_num
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

  def get_key(index)
    num = grouped_key[index..index + 1].join
    x = num.rjust(0).to_i + last_four_digits[index]
    return (x % 27) if x > 27
    x
  end
end
