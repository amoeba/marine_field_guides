require 'test_helper'

class TaxonomyTest < ActiveSupport::TestCase
  test "a taxonomy without genus or species is invalid" do
    taxonomy = Taxonomy.new
    assert !taxonomy.valid?, "A taxonomy without genus or species was valid"
  end
  
  test "a taxonomy with a genus and species is valid" do
    taxonomy = Taxonomy.new
    taxonomy.genus = "Some genus"
    taxonomy.species_name = "Some species"
    
    assert taxonomy.valid?, "A taxonomy with a genus and species was invalid"
  end
end
