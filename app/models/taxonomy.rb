class Taxonomy < ActiveRecord::Base
  belongs_to :species
  validates :genus, :species_name, :presence => true
  
  def to_s
    "#TODO#"
  end
end
