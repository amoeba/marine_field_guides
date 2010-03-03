class SpeciesController < ApplicationController
  respond_to :html
  
  def index
    respond_with(@species = Species.all)
  end
  
  def show
    @species = Species.find(params[:id])
    
    @display_image = @species.images.select { |i| i.id == @species.display_image }.first
    
    respond_with(@species)
  end
  
  def new
    @species = Species.new
    @species.build_taxonomy
    
    respond_with(@species)
  end
  
  def create
    # Workaround
    # Without this, validations aren't running on Taxonomy
    #@species = Species.create(params[:species])
    @species = Species.new
    @species.build_taxonomy
    @species.save
    @species.update_attributes(params[:species])

    respond_with(@species)
  end
  
  def edit
    @species = Species.find(params[:id])
    
    respond_with(@species)
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
