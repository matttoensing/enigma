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
enigma = Enigma.new(encrypt, decrypt, offset)

writer = File.open(ARGV[1], 'w')
writer.write(enigma.encrypt[:encryption])
writer.close
puts "Created #{ARGV[1]} with the key #{offset.key} and #{offset.date}"

# handle = File.open(ARGV[0], 'r')
# encrypted_message = handle.read
# handle.close
#
# decrypted_writer = File.open(ARGV[1], 'w')
# decrypted_writer(enigma.decrypt[:decryption])
# decrypted_writer.close
