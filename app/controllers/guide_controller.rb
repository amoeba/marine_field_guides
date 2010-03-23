class GuideController < ApplicationController
  def index
    @species = Species.find(params[:species_ids].split(","))
    @guide = ExtendedGuide.new(@species)
    
    send_data(@guide.render, { :filename => "Field Guide.pdf", :type => Mime::PDF})
  end
end
