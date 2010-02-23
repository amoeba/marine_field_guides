class GuideController < ApplicationController
  def index
    @species = Species.all.take(6)
    @guide = ExtendedGuide.new(@species)
    
    send_data(@guide.render, { :filename => "somepdf.pdf", :type => Mime::PDF})
  end
end
