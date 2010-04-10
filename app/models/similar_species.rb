class SimilarSpecies < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :similar_species_id
  
  def to_s
    "#{scientific_name} (#{first_common_name})"
  end
  
  def similar_to
    Species.where(:id => similar_species_id).first
  end
  
  def scientific_name
    similar_to.scientific_name if similar_to
  end
  
  def first_common_name
    similar_to.common_names.first
  end
end