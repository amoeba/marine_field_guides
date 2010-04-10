class Guide
  def pdf(options = {})
    @pdf ||= ::Prawn::Document.new({:margin => 15})
  end
  
  def render
    @pdf.render
  end
end