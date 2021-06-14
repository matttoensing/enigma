require_relative 'offset'
require_relative 'encryption'
require_relative 'decryption'
require_relative 'enigma'

holder = File.open(ARGV[0], 'r')
message = holder.read
holder.close

offset = Offset.new
encrypt = Encryption.new(message, offset)
decrypt = Decryption.new(encrypt.message_encrypted, offset)
enigma = Enigma.new(offset, encrypt, decrypt)

writer = File.open(ARGV[1], 'w')
writer.write(enigma.encrypt[:encryption])
writer.close
