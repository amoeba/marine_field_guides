class Character < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :name, :value, :unit
end
