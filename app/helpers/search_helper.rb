module SearchHelper
  def add_filter_button(filter)    
    content = render :partial => "search/filter", :locals => { :filter => filter_defaults }
    button_to_function "Add Filter", "insert_filter(\"#{escape_javascript(content)}\")"
  end
  
  def add_child_link(name, f, method, options = {})
    fields = new_child_fields(f, method, options)
    button_to_function "Add", "insert_fields(this, '#{method}', '#{escape_javascript(fields)}')"
  end
  
  def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
    options[:partial] ||= method.to_s.singularize
    options[:form_builder_local] ||= :f
    form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
      render :partial => options[:partial], :locals => { options[:form_builder_local] => f }
    end
  end
  
  def render_filter(filter)
    # If string, extend the default with it
    # If hash, extend the default with it
    
    filter = { 'association' => filter } if filter.kind_of? String
    filter = filter_defaults.merge(filter)
    
    render :partial => "filter", :locals => { :filter => filter }
  end
  
  def filter_defaults
    { 'association' => "taxonomy",
      'left' => "",
      'middle' => "",
      'right' => ""
    }
  end
  
  def options_for_taxonomy
    [
      ["Domain", "domain"],
      ["Kingdom", "kingdom"],
      ["Subkingdom", "subkingdom"],
      ["Superphylum/Superdivision", "superphylum"],
      ["Phylum/Division", "phylum"],
      ["Subphylum/Subdivision", "subphylum"],
      ["Superclass", "superclass"],
      ["Class", "klass"],
      ["Subclass", "subclass"],
      ["Superorder", "superorder"],
      ["Order", "order"],
      ["Suborder", "suborder"],
      ["Superfamily", "superfamily"],
      ["Family", "family"],
      ["Subfamily", "subfamily"],
      ["Genus", "genus"],
      ["Species", "species_name"],
      ["Subspecies", "subspecies"]
    ]
  end
  
  def options_for_filter
    options = Species.reflect_on_all_associations.inject([]) do |options, assoc|
      name = assoc.name.to_s
      options << [name.humanize, name] unless name == "images"
      options
    end
    
    options.sort
  end
end
