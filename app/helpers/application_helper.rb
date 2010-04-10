module ApplicationHelper
  def quicksearch_path
    params['controller'] =~ /admin/ ? '/admin/species' : '/search'
  end
end
