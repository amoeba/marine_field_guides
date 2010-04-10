require 'test_helper'

class DistinguishingCharactersTest < ActiveSupport::TestCase
  test "a distinguishing character without a value should be invalid" do
    distinguishing_character = DistinguishingCharacter.new
    
    assert !distinguishing_character.valid?, "A distinguishign character without a value was valid"
  end
end
