require 'test_helper'

class SpeciesTest < ActiveSupport::TestCase
  test "a species without genus and species should not save" do
    species = Species.new
    assert !species.save, "Saved Species without genus and species"
  end
  
  test "a species without genus and species should not be valid" do
    species = Species.new
    
    assert !species.valid?, "Species without genus and species was valid"
  end
  
  test "a species with only a genus should not be valid" do
    species = Species.new
    species.build_taxonomy
    species.taxonomy.genus = "Some genus"
    
    assert !species.valid?, "Species with only a genus was valid"
  end
  
  test "a species with only a species should not be valid" do
    species = Species.new
    species.build_taxonomy
    species.taxonomy.species_name = "Some species"
    
    assert !species.valid?, "Species with only a species was valid"
  end
  
  test "a species with a genus and species should be valid" do
    species = Species.new
    species.build_taxonomy
    species.taxonomy.genus = "Some genus"
    species.taxonomy.species_name = "Some species"
    
    assert species.valid?, "Species with genus and species was valid"
  end
  
  test "a species should return its scientific_name" do
    species = Species.new
    species.build_taxonomy
    species.taxonomy.genus = "Oncorhynchus"
    species.taxonomy.species_name = "nerka"
    
    assert species.scientific_name == "Oncorhynchus nerka"
  end
end
