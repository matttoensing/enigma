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

    it 'can create a new index to select a chara character for elements' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expect(encrypt.update(2, 30)).to eq(5)
    end

    it 'can find a character in alphabet with 2 indexes' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expect(encrypt.character(0, 2)).to eq("j")
    end

    it 'can shift every char and replace it with a new one' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)

      expected = "tcdlgtitu"

      expect(encrypt.encrypt).to eq(expected)
    end

    it 'will not replace a character in message if it is not found in alphabet' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Hello World!", offset)


      expected = "ogwdvbggyno!"

      expect(encrypt.encrypt).to eq(expected)
    end
  end
end
