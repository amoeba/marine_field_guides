class Taxonomy < ActiveRecord::Base
  belongs_to :species
  validates :genus, :species_name, :presence => true
  
  def to_s
    [phylum, klass, order, family].collect do |taxon|
      taxon.nil? or taxon.length == 0 ? "Unspecified" : taxon
    end.join(", ")
  end
end
