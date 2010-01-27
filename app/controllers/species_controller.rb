class SpeciesController < ApplicationController
  def index
    @species = Species.find(:all)
  end
  
  def show
    @species = Species.find(params[:id])
  end
  
  def new
    @species = Species.new
    @species.characters.build
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @species = Species.new(params[:species])
    
    if(@species.save)
      flash[:notice] = "Successfully created Species and ____"
      redirect_to(species_instance_path(@species))
    else
      render(:action => "new")
    end
  end
  
  def edit
    @species = Species.find(params[:id])
  end
  
  def update
    params[:species][:existing_character_attributes] ||= {}
    
    @species = Species.find(params[:id])
    
    if(@species.update_attributes(params[:species]))
      flash[:notice] = "Successfully updated Species and ____"
      redirect_to(species_instance_path(@species))
    else
      render(:action => 'edit')
    end
  end
  
  def destroy
    @species = Species.find(params[:id])
    
    if(@species.destroy)
      flash[:notice] = "Successfully destroyed Species"
      redirect_to(:controller => "species")
    else
      render(:action => "edit")
    end
  end
end
