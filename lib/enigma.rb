
class Enigma
  attr_reader :offset,
              :encryption,
              :decryption

  def initialize(encryption, decryption, offset = Offset.new)
    @offset = offset
    @encryption = encryption
    @decryption = decryption
  end

  def encrypt(message = @encryption.message, key = @offset.key, date = @offset.date)
    {
      encryption: @encryption.message_encrypted.strip,
      key: key,
      date: date
    }
  end

  def decrypt(message = encrypt[:encryption], key = @offset.key, date = @offset.date)
    {
      decryption: @decryption.message_decrypted,
      key: key,
      date: date
    }
  end
end
