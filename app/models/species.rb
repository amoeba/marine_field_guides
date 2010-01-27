class Species < ActiveRecord::Base
  has_many :characters, :dependent => :destroy
  
  validates_presence_of :scientific_name
  accepts_nested_attributes_for :characters,
    :reject_if => lambda { |a| a.values.all?(&:blank?) },
    :allow_destroy => true
end