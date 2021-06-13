require_relative "spec_helper"

RSpec.describe Enigma do
  context 'instantiation' do
    it 'exists' do
      enigma = Enigma.new('./message.txt')

      expect(enigma).to be_an_instance_of(Enigma)
    end

    it 'has a file path' do
      enigma = Enigma.new('./message.txt')

      expect(enigma.file_path).to eq('./message.txt')
    end
  end

  context 'methods' do
    it 'can read files' do
      enigma = Enigma.new('./message.txt')

      expected = "Matt Ryan\n"

      expect(enigma.message).to eq(expected)
    end

    it 'can show encrypted text and key/date' do
      enigma = Enigma.new('./message.txt')

      expected = {
        encryption: 'tcdlgtitu',
        key: "02345",
        date: "110621"
      }

      expect(enigma.encrypt).to eq(expected)
    end
  end
end
