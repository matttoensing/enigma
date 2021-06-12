require_relative 'spec_helper'

RSpec.describe Alphabet do
  context "instantiation" do
    it 'exists' do
      alpha = Alphabet.new

      expect(alpha).to be_an_instance_of(Alphabet)
    end

    it 'has an alphabet upon instantiation' do
      alpha = Alphabet.new

      expect(alpha.elements.length).to eq(27)
      expect(alpha.elements.class).to eq(Array)
    end
  end
end
