class Admin::SpeciesController < Admin::AdminController
  respond_to :html
  
  def index
  end
  
  def show
    @species = ::Species.find(params[:id])
    # TODO: Refactor this into the Species model
    @display_image = @species.images.select { |i| i.id == @species.display_image }.first
    
    respond_with(@species)
  end
  
  def new
    @species = ::Species.new
    @species.build_taxonomy
    
    respond_with(@species)
  end
  
  def create
    @species = ::Species.new(params[:species])
    
    if @species.save
      flash[:notice] = "Successfully created species."
      respond_with(@species)
    else
      render :action => :new
    end
  end
  
  def edit
    @species = ::Species.find(params[:id])
    
    respond_with(@species)
  end
  
  def update
    @species = ::Species.find(params[:id])
    
    if @species.update_attributes(params[:species])
      flash[:notice] = "Successfully updated species."
      respond_with(@species)
    else
      render :action => :edit
    end
  end
  
  def destroy
    @species = :Species.find(params[:id])
    @species.destroy
    
    flash[:notice] = "Successfully deleted species."
    redirect_to(:controller => 'admin/species')
  end
end