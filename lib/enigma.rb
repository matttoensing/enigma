
class Enigma
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
    @offset = Offset.new("02345", "110621")
    @encryption = Encryption.new(message, @offset)
  end

  def message
    holder = File.open(ARGV[0], 'r')
    incoming_message = holder.read
    holder.close
  end

  def encrypt
    {
      encryption: @encryption.message_encrypted.strip,
      key: @offset.key,
      date: @offset.date
    }
  end
end
