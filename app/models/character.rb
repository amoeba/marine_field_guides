class Character < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :name, :morph, :value, :unit
  
  def to_s
    "field goes here"
  end
end
