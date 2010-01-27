module SpeciesHelper
  def add_character_link(name)
    link_to_function(name, :class => "action") do |page|
      page.insert_html(:bottom, :characters, :partial => 'character', :locals => {:character => Character.new })
    end
  end
  
  def form_action(arg)
    # New => 
  end
end
