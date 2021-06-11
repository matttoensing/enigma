require_relative "spec_helper"

RSpec.describe Offset do
  context "intantiation" do
    it 'exists' do
      offset = Offset.new

      expect(offset).to be_an_instance_of(Offset)
    end

    it 'has attributes' do
      offset = Offset.new

      expect(offset.values.length).to eq(50)
      expect(offset.values.class).to eq(Array)
    end

    it 'can generate a random 5 digit number' do
      offset = Offset.new
      allow(offset).to receive(:key).and_return(["0", "3", "5", "8", "4"])

      expect(offset.key).to eq(["0", "3", "5", "8", "4"])
      expect(offset.key.length).to eq(5)
    end
  end

  context 'methods' do
    it 'can create the A key' do
      offset = Offset.new
      allow(offset).to receive(:a_key).and_return(03)

      expect(offset.a_key).to eq(03)
    end

    it 'can create the B key' do
      offset = Offset.new
      allow(offset).to receive(:b_key).and_return(35)

      expect(offset.b_key).to eq(35)
    end

    it 'can create the C key' do
      offset = Offset.new
      allow(offset).to receive(:c_key).and_return(58)

      expect(offset.c_key).to eq(58)
    end

    it 'can create the D key' do
      offset = Offset.new
      allow(offset).to receive(:d_key).and_return(84)

      expect(offset.d_key).to eq(84)
    end
  end
end
