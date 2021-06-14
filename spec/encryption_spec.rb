require_relative "spec_helper"

RSpec.describe Encryption do
  context 'instantiation' do
    it 'exists' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expect(encrypt).to be_an_instance_of(Encryption)
    end

    it 'has attributes' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expected = ['m', 'a', 't', 't', ' ', 'r', 'y', 'a', 'n']

      expect(encrypt.message).to eq(expected)
      expect(encrypt.offset).to be_an_instance_of(Offset)
      expect(encrypt.elements.class).to eq(Array)
      expect(encrypt.elements.length).to eq(27)
    end
  end

  context 'methods' do
    it 'can split the message into sub arrays' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expected = [['m', 'a', 't', 't'], [' ', 'r', 'y', 'a'], ['n']]

      expect(encrypt.split).to eq(expected)
    end

    it 'can shift the alphabet' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expected = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

      expect(encrypt.shift(2)).to eq(expected)
    end

    it 'can create a new index to select a character for elements' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expect(encrypt.update(2, 30)).to eq(5)
    end

    it 'can find a character with 2 indexes' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expect(encrypt.character(0, 2)).to eq('j')
    end

    it 'can shift every char and replace it with a new one' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)
      encrypt2 = Encryption.new("Hello World!", offset)

      expected = ["t", "c", "d", "l", "g", "t", "i", "t", "u"]

      expect(encrypt.encrypt).to eq(expected)

      expected2 = ["o", "g", "w", "d", "v", "b", "g", "g", "y", "n", "o", "!"]

      expect(encrypt2.encrypt).to eq(expected2)
    end

    it 'can convert encryption to a string' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expected = 'tcdlgtitu'

      expect(encrypt.message_encrypted).to eq(expected)
    end
  end
end
