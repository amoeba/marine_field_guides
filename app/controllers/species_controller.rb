class SpeciesController < ApplicationController
  respond_to :html
  
  def index
    redirect_to :controller => 'pages'
  end
  
  def show
    @species = Species.find(params[:id])
    
    respond_with(@species)
  end
end
