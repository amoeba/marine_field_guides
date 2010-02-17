class SimpleGuide < Guide
  
  def write
    @species.each do |s|
      pdf.text "#{s}"
    end
  end
end