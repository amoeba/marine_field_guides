class Taxonomy < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :genus, :species
  
  def to_s
    "#{phylum} > #{klass} > #{order} > #{family}"
  end
end
