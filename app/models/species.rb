class Species < ActiveRecord::Base
  has_many :characters, :dependent => :destroy
  
  validates_presence_of :scientific_name
  validates_associated  :characters
  
  after_update :save_characters
  
  def new_character_attributes=(character_attributes)
    character_attributes.each do |attributes|
      characters.build(attributes)
    end
  end
  
  def existing_character_attributes=(character_attributes)
    characters.reject(&:new_record?).each do |character|
      attributes = character_attributes[character.id.to_s]
      
      if(attributes)
        character.attributes = attributes
      else
        characters.delete(character)
      end
    end
  end
  
  private
  
  def save_characters
    characters.each do |character|
      character.save(false)
    end
  end
end