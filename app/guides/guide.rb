class Guide
  def pdf(options = {})
    @pdf ||= ::Prawn::Document.new(options)
  end
  
  def render
    @pdf.render
  end
end