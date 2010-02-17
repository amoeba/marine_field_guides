class Synonym < ActiveRecord::Base
  belongs_to :species
  validates_presence_of :value
  
  def to_s
    value
  end
end
