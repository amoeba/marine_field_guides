class Taxonomy < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :kindgom, :phylum, :class, :order, :family
end
