class Taxonomy < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :kingdom, :phylum, :klass, :order, :family
  
  def to_long_string
    "#{phylum} > #{klass} > #{order} > #{family}"
  end
end
