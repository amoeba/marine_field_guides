class ExtendedGuide < Guide  
  def initialize(species)
    @species = species
  end
  
  def render
    header_height = 50
    footer_height = pdf.font.height
    
    pdf.stroke_color = "CCCCCC"

    pdf.repeat :all do
      pdf.text "Field Guide for the Puget Sound Region", :size => 24
      pdf.indent 40 do
        pdf.text "Salmon", :size => 18, :style => :bold
      end
  
      pdf.text_box "Copyright Information", :at => [pdf.bounds.left, pdf.bounds.bottom + footer_height], :width => pdf.bounds.width, :height => footer_height, :align => :right
    end

    # Front Page
    
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - header_height], :width => pdf.bounds.width, :height => pdf.bounds.height - header_height - footer_height do
      @species.each_with_index do |s, index|
        front_box s, index
      end
    end

    pdf.start_new_page
    
    # Back Page
    
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - header_height], :width => pdf.bounds.width, :height => pdf.bounds.height - header_height - footer_height do
      @species.each_with_index do |s, index|
        back_box s, index
      end
    end
    
    super
  end
  
  def front_box(species, index)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - (index * (pdf.bounds.height / 3))], :width => pdf.bounds.width, :height => pdf.bounds.height / 3 - 10 do
      pdf.stroke_bounds
    
      pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width / 2, :height => pdf.bounds.height do
        pdf.stroke_bounds
    
        if species.images.first
          pdf.image "#{Rails.root}/public/#{species.images.first.image.url}", :at => [pdf.bounds.left, pdf.bounds.top], :fit => [pdf.bounds.width - 10, pdf.bounds.height - 10], :vposition => :center
        else
          pdf.text "No image to display for this species"
        end
      end
  
      pdf.bounding_box [pdf.bounds.left + pdf.bounds.width / 2, pdf.bounds.top], :width => pdf.bounds.width / 2, :height => pdf.bounds.height do
        pdf.stroke_bounds
    
        pdf.fill_color = "767876"
        pdf.text "Scientific Name", :size => 16, :leading => 2.5
        pdf.indent 40 do
          pdf.fill_color = "000000"
          pdf.text species.scientific_name, :style => :bold_italic, :leading => 2.5
        end
    
        pdf.fill_color = "767876"
        pdf.text "Common Name(s)", :size => 16, :leading => 2.5
        pdf.indent 40 do
          pdf.fill_color = "000000"
          pdf.text species.common_names.join(", "), :style => :bold, :leading => 2.5
        end
    
        pdf.fill_color = "767876"
        pdf.text "Habitats", :size => 16, :leading => 2.5
        pdf.indent 40 do
          pdf.fill_color = "000000"
          pdf.text species.habitats.join(", "), :style => :bold, :leading => 2.5
        end
    
        pdf.fill_color = "767876"
        pdf.text "Distribution", :size => 16, :leading => 2.5
        pdf.indent 40 do  
          pdf.fill_color = "000000"
          pdf.text species.distribution.join(", "), :style => :bold, :leading => 2.5
        end
    
        pdf.fill_color = "767876"
        pdf.text "Abundance in Puget Sound", :size => 16, :leading => 2.5
        pdf.indent 40 do
          pdf.fill_color = "000000"
          pdf.text species.abundances.join(", "), :style => :bold, :leading => 2.5
        end
      end
    end
  end

  def back_box(species, index)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - (index * (pdf.bounds.height / 3))], :width => pdf.bounds.width, :height => pdf.bounds.height / 3 - 10 do
      pdf.stroke_bounds
  
      pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width, :height => pdf.font.height * 4 do
        pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width / 3 do  
          pdf.fill_color = "767876"
          pdf.text "Scientific Name", :leading => 2.5
          pdf.indent 20 do  
            pdf.fill_color = "000000"
            pdf.text species.scientific_name, :style => :bold_italic, :leading => 2.5
          end
        end
  
        pdf.bounding_box [pdf.bounds.left + pdf.bounds.width / 3, pdf.bounds.top], :width => pdf.bounds.width * 2 / 3 do
          pdf.fill_color = "767876"
          pdf.text "Synonyms", :leading => 2.5
          pdf.indent 20 do  
            pdf.fill_color = "000000"
            pdf.text species.synonyms.join(", "), :style => :bold_italic, :leading => 2.5
          end
        end
      end
      
      pdf.fill_color = "767876"
      pdf.text "Taxonomy (Phylum, Class, Order, Family)", :leading => 2.5
      pdf.indent 20 do  
        pdf.fill_color = "000000"
        pdf.text "species.taxonomy", :leading => 2.5
      end
      pdf.fill_color = "767876"
      pdf.text "Similar species", :leading => 2.5
      pdf.indent 20 do  
        pdf.fill_color = "000000"
        # TODO Pull up common name for the species
        pdf.text species.similar_species.join(", "), :leading => 2.5
      end
  
      pdf.fill_color = "767876"
      pdf.text "Distinguishing Characters", :leading => 2.5
      pdf.indent 20 do  
        pdf.fill_color = "000000"
        pdf.text species.distinguishing_characters.join("; "), :leading => 2.5
      end
  
      pdf.fill_color = "767876"
      pdf.text "Natural History Information", :leading => 2.5
      pdf.indent 20 do  
        pdf.fill_color = "000000"
        pdf.text species.natural_histories.join("; "), :leading => 2.5
      end
    end
  end
end