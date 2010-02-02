class SpeciesController < ApplicationController
  def index
    @species = Species.find(:all)
  end
  
  def show
    @species = Species.find(params[:id])
  end
  
  def new
    @species = Species.new
  end
  
  def create
    @species = Species.new(params[:species])
    
    if(@species.save)
      flash[:notice] = "Successfully created Species"
      redirect_to(@species)
    else
      render(:action => "new")
    end
  end
  
  def edit
    @species = Species.find(params[:id])
  end
  
  def update
    @species = Species.find(params[:id])
    
    if(@species.update_attributes(params[:species]))
      flash[:notice] = "Successfully updated Species"
      redirect_to(species_instance_url(@species))
    else
      render(:action => 'edit')
    end
  end
  
  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    flash[:notice] = "Successfully deleted Species"
    redirect_to(species_url)
  end
end
