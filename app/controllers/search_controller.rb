class SearchController < ApplicationController
  respond_to :html, :json
  
  def index
    if params[:scientific_name].nil? or params[:scientific_name].length == 0
      flash[:notice] = "You must enter a scientific name"
    else
      names = params[:scientific_name].split(" ")
      
      query = "genus LIKE ?"
      values = ["%#{names[0]}%"]
      
      if names.length > 1
        query << " AND species_name LIKE ?"
        values << "%#{names[1]}%"
      end
    
      @species = Species.where([query, *values]).joins(:taxonomy).includes(:taxonomy)
    end
  end
  
  def advanced
    if params[:filters]      
      @filters = process_filter_params(params[:filters])
      
      @species = Species.scoped
      
      @filters.each do |assoc, statements|
        @species = @species.joins(assoc)
        
        statements.each do |s|
          @species = @species.where(s)
        end
      end
    else

    end
  end
  
  def autocomplete
    terms = params[:term].split(" ").map { |value| "%#{value}%" }
    
    clause = ""
    values = []
    
    terms.each do |term|
      clause << "genus LIKE ? OR species_name LIKE ? OR common_names.value LIKE ? "
      values << term << term << term
    end
    
    @species = Species.joins(:taxonomy, :common_names).includes(:taxonomy, :common_names).where([clause, *values])
    @results = @species.uniq.map { |species| { 
      :label => "<span class=\"scientific-name\">" + species.scientific_name + "</span> (" + species.common_name + ")", 
      :scientific_name => species.scientific_name,
      :value => species.id.to_s } 
    }
    
    respond_with(@results.to_json, :status => :ok)
  end
  
  protected
  def process_filter_params(filter_params = [])
    return nil if filter_params.empty?
    
    @filters = {}
    
    filter_params.each do |filter|
      # Don't process incomplete filters
      next if filter.detect { |k,v| v == "" }
      
      assoc = filter["association"].to_sym
      
      @filters[assoc] ||= []
      @filters[assoc] << process_filter(assoc, filter)
    end
  
    @filters
  end
  
  def process_filter(association, filter)    
    if association == :characters
      statement = "name LIKE ? AND value #{filter["middle"]} ?"
      values = ["#{filter["left"]}", "#{filter["right"]}"]
    else
      statement = "#{filter["left"]} #{filter["middle"]} ?"
      values = ["%#{filter["right"]}%"]
    end
  
    [statement, *values]
  end
end
