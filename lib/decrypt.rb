require_relative 'key_generator'
require_relative 'rotator'
require_relative 'cipher'
require_relative 'messages'

class Decrypt
  attr_reader :message_file, :target_file, :key, :date, :cipher, :decrypted_message, :output_messages

  def initialize(message_file, target_file, key, date)
    @message_file      = message_file
    @target_file       = target_file
    @key               = key
    @date              = date

    rotator            = Rotator.new(key, date)
    @cipher            = Cipher.new(read_file, rotator)
    @output_messages   = Messages.new
  end

  def decrypt_message
    @decrypted_message = cipher.decrypt
  end

  def write_file
    File.open(target_file, "w"){ |file| file.puts decrypted_message}
  end

  def success_message
    output_messages.success(target_file, key, date)
  end

  private
  def read_file
    File.open(message_file, "r"){ |file| file.read }.chomp.to_s
  end

end


if __FILE__ == $0
  decrypt = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  decrypt.decrypt_message
  decrypt.write_file
  puts decrypt.success_message
end
