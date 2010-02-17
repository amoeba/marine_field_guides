class Species < ActiveRecord::Base
  validates_presence_of :scientific_name
  
  models = [:abundances, :characters, :common_names, :distinguishing_characters, :distribution, :habitats, :images, :natural_histories, :similar_species, :synonyms]
  
  models.each do |model|
    has_many model, :dependent => :destroy
    
    accepts_nested_attributes_for model,
      :reject_if => lambda { |a| a.values.all?(&:blank?) },
      :allow_destroy => true
  end
  
  has_one :taxonomy, :dependent => :destroy
  accepts_nested_attributes_for :taxonomy,
    :reject_if => lambda { |a| a.values.all?(&:blank?) },
    :allow_destroy => true
end