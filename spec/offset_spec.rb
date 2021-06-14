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

    # stub out random generator method
    # pick a random number
    # stub out random function before calling offset.new
    it 'has methods for default attributes' do
      allow_any_instance_of(Offset).to receive(:todays_date).and_return("130621")
      allow_any_instance_of(Offset).to receive(:random_number_generator).and_return("02345")

      offset = Offset.new

      expect(offset.key).to eq("02345")
      expect(offset.date).to eq("130621")
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
      expect(offset.grouped_key.length).to eq(5)
    end

    it 'can create the keys based on index' do
      offset = Offset.new("02345", "110621")

      expect(offset.get_key(0)).to eq(7)
      expect(offset.get_key(1)).to eq(2)
      expect(offset.get_key(2)).to eq(11)
      expect(offset.get_key(3)).to eq(19)
    end
  end

  context 'testing random number and date' do

    it 'can square the default date' do
      allow_any_instance_of(Offset).to receive(:todays_date).and_return("130621")

      offset = Offset.new

      expect(offset.square_date).to eq(17061845641)
    end

    it 'can remove the last four numbers of the squared date' do
      allow_any_instance_of(Offset).to receive(:todays_date).and_return("130621")

      offset = Offset.new

      expected = [5, 6, 4, 1]

      expect(offset.last_four_digits).to eq(expected)
    end

    it 'can convert the default key into a collection' do
      allow_any_instance_of(Offset).to receive(:random_number_generator).and_return("02345")

      offset = Offset.new

      expected = ["0", "2", "3", "4", "5"]

      expect(offset.grouped_key).to eq(expected)
      expect(offset.grouped_key.length).to eq(5)
    end

    it 'can create keys based on an index' do
      allow_any_instance_of(Offset).to receive(:todays_date).and_return("130621")
      allow_any_instance_of(Offset).to receive(:random_number_generator).and_return("02345")

      offset = Offset.new

      expect(offset.get_key(0)).to eq(7)
      expect(offset.get_key(1)).to eq(2)
      expect(offset.get_key(2)).to eq(11)
      expect(offset.get_key(3)).to eq(19)
    end
  end
end
