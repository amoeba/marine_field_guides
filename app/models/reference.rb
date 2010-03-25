class Reference < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :value
end
