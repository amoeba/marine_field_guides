require 'test_helper'

class SynonymTest < ActiveSupport::TestCase
  test "a synonym without a value should be invalid" do
    synonym = Synonym.new
    
    assert !synonym.valid?, "A synonym without a value was valid"
  end
end
