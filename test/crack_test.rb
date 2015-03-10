require_relative 'test_helper'
require_relative '../lib/crack'

class CrackTest < Minitest::Test
  def test_it_exists
    assert Crack.new('encrypted.txt', 'cracked.txt', 030415)
  end

  def test_it_responds_to_crack_file
    crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
    assert crack.respond_to?(:crack_file)
  end

  # Can't Test Private Methods
  # def test_secret_code_is_not_decrypted_from_start
  #   crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
  #   refute crack.confirmed_decrypted?
  # end

  def test_it_responds_to_write_file
    crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
    assert crack.respond_to?(:write_file)
  end

  def test_write_file_includes_a_file
    crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
    assert_instance_of NilClass, crack.write_file
  end

  def test_it_responds_to_success_message
    crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
    assert crack.respond_to?(:success_message)
  end

  def test_success_message_returns_a_string
    crack = Crack.new('encrypted.txt', 'cracked.txt', 030415)
    assert_instance_of String, crack.success_message
  end


end
