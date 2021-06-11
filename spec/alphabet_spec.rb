require_relative 'spec_helper'

RSpec.describe Alphabet do
  it 'exists' do
    alpha = Alphabet.new

    expect(alpha).to be_an_instance_of(Alphabet)
  end
end
