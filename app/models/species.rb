class Species < ActiveRecord::Base
  models = [:abundances, 
    :characters, 
    :common_names, 
    :distinguishing_characters, 
    :distribution, 
    :habitats, 
    :images, 
    :natural_histories, 
    :similar_species, 
    :synonyms
  ]
  
  models.each do |model|
    has_many model, :dependent => :destroy
    accepts_nested_attributes_for model,
      :reject_if => :all_blank,
      :allow_destroy => true
  end
  
  has_one :taxonomy, :dependent => :destroy
  
  accepts_nested_attributes_for :taxonomy,
    :reject_if => proc { |a| a['genus'].blank? or a['species_name'].blank? },
    :allow_destroy => true
  
  def scientific_name
    "#{taxonomy.genus} #{taxonomy.species_name}" if taxonomy
  end
end