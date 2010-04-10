require 'test_helper'

class DistributionTest < ActiveSupport::TestCase
  test "a distribution without a value should be invalid" do
    distribution = Distribution.new
    
    assert !distribution.valid?, "A distribution without a value was valid"
  end
end
