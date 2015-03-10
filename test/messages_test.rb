require_relative 'test_helper'
require_relative '../lib/messages'

class MessagesTest < Minitest::Test
  def test_it_exists
    assert Messages.new
  end

  def test_success_message_returns_a_string
    messages = Messages.new
    assert_instance_of String, messages.success('encrypted.txt', '12345', '030815')
  end

  def test_validate_date_adds_leading_zero_to_five_digit_number
    messages = Messages.new
    assert_equal '030315', messages.validate_date('30315')
  end

  def test_validate_date_adds_does_nothing_to_six_digit_date
    messages = Messages.new
    assert_equal '030315', messages.validate_date('030315')
  end
end
