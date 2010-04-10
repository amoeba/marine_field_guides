class Species < ActiveRecord::Base
  validates :taxonomy, :presence => true
  
  models = [:abundances, 
    :characters, 
    :common_names, 
    :distinguishing_characters, 
    :distribution, 
    :habitats, 
    :images, 
    :natural_histories, 
    :references,
    :similar_species, 
    :synonyms
  ]
  
  models.each do |model|
    has_many model, :dependent => :destroy
    accepts_nested_attributes_for model, :allow_destroy => true
  end
  
  has_one :taxonomy, :dependent => :destroy
  accepts_nested_attributes_for :taxonomy
  
  def scientific_name
    "#{taxonomy.genus} #{taxonomy.species_name}" if taxonomy
  end
  
  # Returns the first ("best") common name for this species or false if the species
  # has no common names
  def common_name
    common_names.size > 0 ? common_names.first.value : "No Common Name(s)"
  end
  
  #TODO
  def display_image
    
  end
end