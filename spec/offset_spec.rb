require_relative 'spec_helper'
require 'date'

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

    it 'has methods for default attributes' do
      offset = Offset.new
      allow(offset).to receive(:key).and_return("02345")
      allow(offset).to receive(:date).and_return("130621")

      expect(offset.key).to eq("02345")
      expect(offset.date).to eq("130621")
      expect(offset.random_number_generator.length).to eq(5)
    end
  end

  context 'methods' do
    it 'can square the date' do
      offset = Offset.new("02345", "110621")

      expect(offset.square_date).to eq(12237005641)
    end

    xit 'can square the default date' do
      offset = Offset.new
      allow(offset).to receive(:date).and_return("120621")

      expect(offset.square_date).to eq(17061845641)
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

    xit 'can convert the default key into a collection' do
      offset = Offset.new
      allow(offset).to receive(:key).and_return("02345")

      expected = ["0", "2", "3", "4", "5"]

      expect(offset.grouped_key).to eq(expected)
    end

    it 'can create the A key' do
      offset = Offset.new("02345", "110621")

      expect(offset.a_key).to eq(7)
    end

    it 'can create the B key' do
      offset = Offset.new("02345", "110621")

      expect(offset.b_key).to eq(2)
    end

    it 'can create the C key' do
      offset = Offset.new("02345", "110621")

      expect(offset.c_key).to eq(11)
    end

    it 'can create the D key' do
      offset = Offset.new("02345", "110621")

      expect(offset.d_key).to eq(19)
    end
  end
end
