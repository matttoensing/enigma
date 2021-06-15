require_relative 'offset'
require_relative 'encryption'
require_relative 'decryption'
require_relative 'enigma'

holder = File.open(ARGV[0], 'r')
message = holder.read
holder.close

offset = Offset.new(ARGV[2], ARGV[3])
encrypt = Encryption.new(message, offset)
decrypt = Decryption.new(message, offset)
enigma = Enigma.new(encrypt, decrypt, offset)

writer = File.open(ARGV[1], 'w')
writer.write(decrypt.message_decrypted)
writer.close

puts "Created #{ARGV[1]} with the key #{offset.key} and #{offset.date}"
