require_relative "spec_helper"

RSpec.describe Encryption do
  context 'instantiation' do
    it 'exists' do
      encrypt = Encryption.new("Matt Ryan")

      expect(encrypt).to be_an_instance_of(Encryption)
    end

    it 'has attributes' do
      encrypt = Encryption.new("Matt Ryan")

      expect(encrypt.message).to eq("matt ryan")
      expect(encrypt.offset).to be_an_instance_of(Offset)
      expect(encrypt.elements.class).to eq(Array)
    end
  end

  context 'methods' do
    it 'can put message into an array' do
      encrypt = Encryption.new("Matt Ryan")

      expected = ['m', 'a', 't', 't', ' ', 'r', 'y', 'a', 'n']

      expect(encrypt.transform_message).to eq(expected)
    end

    it 'can shift the alphabet' do
      encrypt = Encryption.new("Matt Ryan")

      expected = ["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b"]

      expect(encrypt.shift(2)).to eq(expected)
    end
  end
end
