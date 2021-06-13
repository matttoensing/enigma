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

      expect(decrypt.encryped_message).to eq('tcdlgtitu')
      expect(decrypt.offset).to be_an_instance_of(Offset)
      expect(decrypt.elements.class).to eq(Array)
      expect(decrypt.elements.length).to eq(27)
    end
  end

  context 'methods' do
    it 'can group encrypted message into an array' do
      offset = Offset.new("02345", "110621")
      decrypt = Decryption.new('tcdlgtitu', offset)

      expected = ['t', 'c', 'd', 'l', 'g', 't', 'i', 't', 'u']

      expect(decrypt.group).to eq(expected)
    end
  end
end
