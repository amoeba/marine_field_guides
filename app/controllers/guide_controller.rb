class GuideController < ApplicationController
  def index
    @species = []
  end
  
  def generate
    @species = Species.find(params[:species_ids].split(","))
    @style = params[:style]
    
    case @style
    when "simple"
      @guide = SimpleGuide.new(@species, options)
    when "gallery"
      @guide = GalleryGuide.new(@species, options)
    else
      @guide = ExtendedGuide.new(@species, options)
    end
    
    send_data(@guide.render, { :filename => "Field Guide.pdf", :type => Mime::PDF}) 
  end
end
