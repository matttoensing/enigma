require_relative "spec_helper"

RSpec.describe Encryption do
  context 'instantiation' do
    it 'exists' do
      encrypt = Encryption.new("Matt Ryan")

      expect(encrypt).to be_an_instance_of(Encryption)
    end

    it 'has attributes' do
      encrypt = Encryption.new("Matt Ryan")

      expect(encrypt.message).to eq("Matt Ryan")
      expect(encrypt.offset).to be_an_instance_of(Offset)
      expect(encrypt.elements.class).to eq(Array)
    end
  end

  context 'methods' do
    it 'can put message into an array' do
      encrypt = Encryption.new("Matt Ryan")

      expected = ['M', 'a', 't', 't', ' ', 'R', 'y', 'a', 'n']

      expect(encrypt.transform_message).to eq(expected)
    end
  end
end
