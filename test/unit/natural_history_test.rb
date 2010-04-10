require 'test_helper'

class NaturalHistoryTest < ActiveSupport::TestCase
  test "a natural history without a value should be invalid" do
    natural_history = NaturalHistory.new
    
    assert !natural_history.valid?, "A natural history without a value was valid"
  end
end
