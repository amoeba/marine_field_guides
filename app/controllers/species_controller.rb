class SpeciesController < ApplicationController
  respond_to :html
  
  def index
    respond_with(@species = Species.all)
  end
  
  def show
    @species = Species.find(params[:id])
    @species.build_taxonomy unless @species.taxonomy
    
    respond_with(@species)
  end
  
  def new
    @species = Species.new
    @species.build_taxonomy
    
    respond_with(@species)
  end
  
  def create
    @species = Species.create(params[:species])
    @species.build_taxonomy unless @species.taxonomy
    
    respond_with(@species)
  end
  
  def edit
    @species = Species.find(params[:id])
    @species.build_taxonomy unless @species.taxonomy
    
    respond_with(@species)
  end
  
  def update
    @species = Species.find(params[:id])
    @species.build_taxonomy unless @species.taxonomy
    @species.update_attributes(params[:species])
    
    respond_with(@species)
  end
  
  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to(:controller => :species)
  end
end
