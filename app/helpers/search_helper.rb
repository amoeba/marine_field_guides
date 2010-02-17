module SearchHelper
  def add_filter_button
    content = render :partial => "filter"
    button_to_function "Add Filter", "insert_filter(\"#{content}\")"
  end
end
