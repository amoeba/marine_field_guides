class SimilarSpecies < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :similar_species_id
end
