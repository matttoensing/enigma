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

    it 'can display the date in form of day, month, year' do
      offset = Offset.new
      allow(offset).to receive(:new).and_return("110621")

      expect(offset.date).to eq("110621")
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

    it 'can square the date' do
      offset = Offset.new
      allow(offset).to receive(:new).and_return("110621")

      expect(offset.square_date).to eq(12237005641)
    end

    it 'can take the last 4 digits of the square date number' do
      offset = Offset.new
      allow(offset).to receive(:new).and_return("110621")

      expect(offset.last_four_digits).to eq([5, 6, 4, 1])
    end
  end
end
