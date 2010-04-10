require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase
  test "a reference without a value should be invalid" do
    reference = Reference.new
    
    assert !reference.valid?, "A reference without a value was valid"
  end
end
