require_relative "spec_helper"

RSpec.describe Encryption do
  context 'instantiation' do
    it 'exists' do
      encrypt = Encryption.new("Matt Ryan")

      expect(encrypt).to be_an_instance_of(Encryption)
    end

    it 'has attributes' do
      encrypt = Encryption.new("Matt Ryan")

      expected = ['m', 'a', 't', 't', ' ', 'r', 'y', 'a', 'n']

      expect(encrypt.message).to eq(expected)
      expect(encrypt.offset).to be_an_instance_of(Offset)
      expect(encrypt.elements.class).to eq(Array)
    end
  end

  context 'methods' do
    it 'can split the message into sub arrays' do
      encrypt = Encryption.new("Matt Ryan")

      expected = [['m', 'a', 't', 't'], [' ', 'r', 'y', 'a'], ['n']]

      expect(encrypt.split).to eq(expected)
    end

    it 'can map each character in message to alphabet position' do
      encrypt = Encryption.new("Matt Ryan")

      expected = [12, 0, 19, 19, 26, 17, 24, 0, 13]

      expect(encrypt.number_values).to eq(expected)
    end

    it 'can shift the alphabet' do
      encrypt = Encryption.new("Matt Ryan")

      expected = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

      expect(encrypt.shift(2)).to eq(expected)
    end
  end
end
