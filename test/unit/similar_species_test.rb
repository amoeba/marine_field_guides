require 'test_helper'

class SimilarSpeciesTest < ActiveSupport::TestCase
  test "a similar species without a similar_species_id should be invalid" do
    similar_species = SimilarSpecies.new
    
    assert !similar_species.valid?, "A similar_species without a similar_species_id was valid"
  end
end
