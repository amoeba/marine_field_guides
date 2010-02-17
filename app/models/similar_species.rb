class SimilarSpecies < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :similar_species_id
  
  def to_s
    "Species##{similar_species_id}"
  end
end
