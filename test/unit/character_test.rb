require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  test "a character without a name and value should be invalid" do
    character = Character.new
    
    assert !character.valid?, "A character wihout a name and value was valid"
  end
  
  test "a character with a name and value should be valid" do
    character = Character.new
    character.name = "A char name"
    character.value = "A value"
    
    assert character.valid?, "A character with a name and value was invalid"
  end
end
