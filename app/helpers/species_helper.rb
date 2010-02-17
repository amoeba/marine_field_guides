module SpeciesHelper
  def remove_child_link(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
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
      render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
    end
  end
end
