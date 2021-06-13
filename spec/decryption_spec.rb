require_relative 'spec_helper'

RSpec.describe Decryption do
  context 'instantiation' do
    it 'exists' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expect(decrypt).to be_an_instance_of(Decryption)
    end

    it 'has attributes' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expected = ['t', 'c', 'd', 'l', 'g', 't', 'i', 't', 'u']

      expect(decrypt.encryped_message).to eq(expected)
      expect(decrypt.offset).to be_an_instance_of(Offset)
      expect(decrypt.elements.class).to eq(Array)
      expect(decrypt.elements.length).to eq(27)
    end
  end

  context 'methods' do
    it 'can group encrypted message into an array' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expected = [['t', 'c', 'd', 'l'], ['g', 't', 'i', 't'], ['u']]

      expect(decrypt.group).to eq(expected)
    end

    it "can shift the alphabet by a given number" do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expected = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

      expect(decrypt.shift(2)).to eq(expected)
    end

    it 'can create a number from two arguments' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expect(decrypt.update_index_value(25, 5)).to eq(20)
      expect(decrypt.update_index_value(25, 40)).to eq(12)
    end

    it 'can find a character from elements with two index numbers as arguments' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expect(decrypt.character(0, 12)).to eq('m')
    end
  end
end
