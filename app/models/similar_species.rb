class SimilarSpecies < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :similar_species_id
  
  def to_s
    "Species##{similar_species_id}"
  end
  
  def scientific_name
    species = Species.where(:id => similar_species_id).first
    species.scientific_name if species
  end
  
  def scientific_name=(value)
    
  end
end