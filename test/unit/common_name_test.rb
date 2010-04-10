require 'test_helper'

class CommonNameTest < ActiveSupport::TestCase
  test "a common name without a value should be invalid" do
    common_name = CommonName.new
    
    assert !common_name.valid?, "A common name without a value was valid"
  end
end
