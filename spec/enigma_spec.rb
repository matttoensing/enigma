require_relative "spec_helper"

RSpec.describe Enigma do
  context 'instantiation' do
    it 'exists' do
      enigma = Enigma.new('./message.txt')

      expect(enigma).to be_an_instance_of(Enigma)
    end

    it 'has a file path' do

    end
  end
end
