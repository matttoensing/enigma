require_relative "spec_helper"

RSpec.describe Offset do
  context "intantiation" do
    it 'exists' do
      offset = Offset.new("02345", "110621")

      expect(offset).to be_an_instance_of(Offset)
    end

    it 'has attributes' do
      offset = Offset.new("02345", "110621")

      expect(offset.key).to eq("02345")
      expect(offset.date).to eq("110621")
    end
  end

  context 'methods' do
    it 'can square the date' do
      offset = Offset.new("02345", "110621")

      expect(offset.square_date).to eq(12237005641)
    end

    it 'can take the last 4 digits of the square date number' do
      offset = Offset.new("02345", "110621")

      expect(offset.last_four_digits).to eq([5, 6, 4, 1])
    end

    it 'can convert the key into a collection' do
      offset = Offset.new("02345", "110621")

      expected = ["0", "2", "3", "4", "5"]

      expect(offset.grouped_key).to eq(expected)
    end

    it 'can create the A key' do
      offset = Offset.new("02345", "110621")

      expect(offset.a_key).to eq(7)
    end

    it 'can create the B key' do
      offset = Offset.new("02345", "110621")

      expect(offset.b_key).to eq(29)
    end

    it 'can create the C key' do
      offset = Offset.new("02345", "110621")

      expect(offset.c_key).to eq(38)
    end

    it 'can create the D key' do
      offset = Offset.new("02345", "110621")

      expect(offset.d_key).to eq(46)
    end
  end
end
