require_relative 'key_generator'
require_relative 'date_generator'
require_relative 'rotator'
require_relative 'cipher'
require_relative 'messages'

class Encrypt
  attr_reader :message_file, :target_file, :key, :date, :cipher, :output_messages, :encrypted_message

  def initialize(message_file, target_file)
    @message_file      = message_file
    @target_file       = target_file

    @key               = KeyGenerator.new.generate_key
    @date              = DateGenerator.new.generate_date
    rotator            = Rotator.new(key, date)
    @cipher            = Cipher.new(read_file, rotator)
    @output_messages   = Messages.new
  end

  def encrypt_message
    @encrypted_message = cipher.encrypt
  end

  def write_file
    File.open(target_file, "w"){ |file| file.puts encrypted_message}
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
  encrypt = Encrypt.new(ARGV[0], ARGV[1])
  encrypt.encrypt_message
  encrypt.write_file
  puts  encrypt.success_message
end
