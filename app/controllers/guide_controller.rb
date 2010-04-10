class GuideController < ApplicationController
  DEFAULTS = {
      "title" => "Marine Field Guide",
      "subtitle" => "Custom Selection of Species",
      "style" => "extended",
      "color" => "000000",
    }
    
  def index
    if !params[:species].nil? and params[:species].length > 0
      @species = Species.find(* params[:species].collect { |s| s["id"] })
    end
  end
  
  def generate
    if params.nil? or !params.key? "species"
      flash[:notice] = "You must specify at least one species for your field guide."
      redirect_to :action => :index
      return
    end
    
    @species = Species.find(*params["species"].map { |s| s["id"].to_i })
    
    # Fix find's habit of turning a single result into Species instead of an Array
    @species = [@species] unless @species.is_a?(Array)
    
    @options = process_guide_parameters(params["options"])
    
    
    case @options["style"]
    when "simple"
      @guide = SimpleGuide.new(@species, @options)
    when "gallery"
      @guide = GalleryGuide.new(@species, @options)
    else
      @guide = ExtendedGuide.new(@species, @options)
    end
    
    send_data(@guide.render, {
      :filename => "Field Guide.pdf", 
      :type => Mime::PDF}
    ) 
  end
  
  protected
  def process_guide_parameters(opts = {})
    DEFAULTS.merge!(opts.reject { |k,v| v.length == 0 })
  end
end
