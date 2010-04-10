require 'test_helper'

class HabitatTest < ActiveSupport::TestCase
  test "a habitat without a value should be invalid" do
    habitat = Habitat.new
    
    assert !habitat.valid?, "A habitat without a value was valid"
  end
end
