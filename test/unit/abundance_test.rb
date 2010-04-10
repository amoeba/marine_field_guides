require 'test_helper'

class AbundanceTest < ActiveSupport::TestCase
  test "an abundance without a value should be invalid" do
    abundance = Abundance.new
    
    assert !abundance.valid?, "An abundance without a value was valid"
  end
end
