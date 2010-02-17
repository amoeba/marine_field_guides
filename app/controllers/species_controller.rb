class SpeciesController < ApplicationController
  respond_to :html
  
  def index
    respond_with(@species = Species.all)
  end
  
  def show
    respond_with(@species = Species.find(params[:id]))
  end
  
  def new
    respond_with(@species = Species.new)
  end
  
  def create
    @species = Species.create(params[:species])
    respond_with(@species)
  end
  
  def edit
    respond_with(@species = Species.find(params[:id]))
  end
  
  def update
    @species = Species.find(params[:id])
    @species.update_attributes(params[:species])
    respond_with(@species)
  end
  
  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to(:controller => :species)
  end
end
