class Image < ActiveRecord::Base
  belongs_to :species
  
  has_attached_file :image
  validates_attachment_presence :image
end
