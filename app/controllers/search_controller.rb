class SearchController < ApplicationController
  def index
  end
  
  def autocomplete
    @results = Species.where("scientific_name LIKE ?", "%#{params[:q]}%")
    render :text => @results.map { |r| "#{r.scientific_name}|#{r.id}" }.join("\n")
  end
end
