class SearchController < ApplicationController
  def index
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
    values = params[:term].split(" ").map { |value| value + "%" }
    clause = "genus LIKE ?"
    clause << " AND species_name LIKE ?" if values.length > 1
    
    @species = Species.joins(:taxonomy).where([clause, *values])
    
    render :json => @species.map { |species| { :label => species.scientific_name, :value => species.id.to_s } }
  end
  
  private
  def process_filter_params(filter_params = [])
    return nil if filter_params.empty?
    
    @filters = {}
    
    filter_params.each do |filter|
      assoc = filter["association"].to_sym
      
      @filters[assoc] = [] unless @filters[assoc]
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
