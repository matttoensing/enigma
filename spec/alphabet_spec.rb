require_relative 'spec_helper'

RSpec.describe Alphabet do
  context "instantiation" do
    it 'exists' do
      alpha = Alphabet.new

      expect(alpha).to be_an_instance_of(Alphabet)
    end

    it 'has an alphabet upon instantiation' do
      alpha = Alphabet.new

      expect(alpha.elements.length).to eq(26)
      expect(alpha.elements.class).to eq(Array)
    end
  end

  context "methods" do
    it "can add a space to elements" do
      alpha = Alphabet.new

      alpha.add_space

      expect(alpha.elements.length).to eq(27)
    end
  end
end
