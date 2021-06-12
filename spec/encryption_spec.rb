require_relative "spec_helper"

RSpec.describe Encryption do
  context 'instantiation' do
    it 'exists' do
      encrypt = Encryption.new

      expect(encrypt).to be_an_instance_of(Encryption)
    end
  end
end
