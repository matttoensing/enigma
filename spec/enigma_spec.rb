require_relative "spec_helper"

RSpec.describe Enigma do
  context 'instantiation' do
    it 'exists' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)
      decrypt = Decryption.new(encrypt.message_encrypted, offset)
      enigma = Enigma.new(encrypt, decrypt, offset)

      expect(enigma).to be_an_instance_of(Enigma)
    end

    it 'has attributes' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)
      decrypt = Decryption.new(encrypt.message_encrypted, offset)
      enigma = Enigma.new(encrypt, decrypt, offset)

      expect(enigma.offset).to be_an_instance_of(Offset)
      expect(enigma.encryption).to be_an_instance_of(Encryption)
      expect(enigma.decryption).to be_an_instance_of(Decryption)
    end
  end

  context 'methods' do
    it 'can show encrypted text and key/date' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)
      decrypt = Decryption.new(encrypt.message_encrypted, offset)
      enigma = Enigma.new(encrypt, decrypt, offset)

      expected = {
        encryption: 'tcdlgtitu',
        key: "02345",
        date: "110621"
      }

      expect(enigma.encrypt("Matt Ryan", "02345", "110621")).to eq(expected)
    end

    it 'can show decrypted text and key/date' do
      offset = Offset.new("02345", "110621")
      encrypt = Encryption.new("Matt Ryan", offset)
      decrypt = Decryption.new(encrypt.message_encrypted, offset)
      enigma = Enigma.new(encrypt, decrypt, offset)

      expected = {
        decryption: 'matt ryan',
        key: "02345",
        date: "110621"
      }

      expect(enigma.decrypt).to eq(expected)
    end
  end
end
