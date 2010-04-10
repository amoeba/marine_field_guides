class ExtendedGuide < Guide

  def initialize(species, options)
    @species = species
    @options = options
  end
  
  def render
    pdf.font_size = 11
    @header_height = 50
    @footer_height = pdf.font.height
    
    pdf.stroke_color = @options["color"]

    pdf.repeat :all do
      pdf.text "<font size='24'><color rgb='#{@options["color"]}'>#{@options["title"]}</color></font>", :inline_format => true
      pdf.indent 20 do
        pdf.text @options["subtitle"], :size => 18, :style => :bold
      end
  
      #pdf.text_box "Copyright Information", :at => [pdf.bounds.left, pdf.bounds.bottom + @footer_height], :width => pdf.bounds.width, :height => @footer_height, :align => :right
      pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + @footer_height], :width => pdf.bounds.width, :height => @footer_height do
        pdf.text "Copyright Information Will Go Here", :inline_format => true, :align => :right
      end
    end

    # Front Page
    pages = (@species.length / 3.0).ceil - 1
    (0..pages).each do |i|
      offset = i * 3
      species_subset = @species[offset..offset + 2]
      
      front_page(species_subset)
      pdf.start_new_page
      back_page(species_subset)
      pdf.start_new_page unless i == pages
    end
    
    # Call the parent render method to generate the PDF
    super
  end
  
  # Front page of the guide
  # Passed 1-3 species
  def front_page(species)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - @header_height], :width => pdf.bounds.width, :height => pdf.bounds.height - @header_height - @footer_height do
      species.each_with_index do |s, index|
        next if s.nil?
        front_box s, index
      end
    end
  end
  
  # Back page of the guide
  # Passed 1-3 species
  def back_page(species)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - @header_height], :width => pdf.bounds.width, :height => pdf.bounds.height - @header_height - @footer_height do
      species.each_with_index do |s, index|
        next if s.nil?
        back_box s, index
      end
    end
  end
  
  def front_box(species, index)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - (index * (pdf.bounds.height / 3))], :width => pdf.bounds.width, :height => pdf.bounds.height / 3 - 10 do
      stroke_rounded_rectangle
    
      pdf.bounding_box [pdf.bounds.left + 15, pdf.bounds.top - 15], :width => pdf.bounds.width / 2 - 30, :height => pdf.bounds.height - 30 do
        #pdf.stroke_bounds
    
        if species.images.first
          pdf.image "#{Rails.root}/public/#{species.images.first.image.url}", :fit => [pdf.bounds.width - 10, pdf.bounds.height - 10], :position => :center, :vposition => :center
        else
          pdf.text "No image to display for this species"
        end
      end
  
      pdf.bounding_box [pdf.bounds.left + pdf.bounds.width / 2 + 15, pdf.bounds.top - 15], :width => pdf.bounds.width / 2 - 30, :height => pdf.bounds.height do
        top = pdf.bounds.top
        left = pdf.bounds.left
        
        pdf.fill_color = "767876"
        pdf.text "Scientific Name", :size => 16

        
        pdf.fill_color = "000000"
        pdf.text_box species.scientific_name,
          :at => [left + 40, pdf.cursor],
          :width => pdf.bounds.width - 32,
          :height => pdf.font.height,
          :style => :bold_italic,
          :overflow => :ellipses
        pdf.move_down 16
        
        pdf.fill_color = "767876"
        pdf.text "Common Name(s)", :size => 16
        
        pdf.fill_color = "000000"
        common_name_text = species.common_names.size == 0 ? "None" : species.common_names.join(", ")
        pdf.text_box common_name_text,
          :at => [left + 40, pdf.cursor],
          :width => pdf.bounds.width - 40,
          :height => pdf.font.height * 2,
          :style => :bold,
          :overflow => :ellipses
        pdf.move_down 28
        
        pdf.fill_color = "767876"
        pdf.text "Habitats", :size => 16
        
        pdf.fill_color = "000000"
        habitat_text = species.habitats.size == 0 ? "None" : species.habitats.join(", ")
        pdf.text_box habitat_text,
          :at => [left + 40, pdf.cursor],
          :width => pdf.bounds.width - 40,
          :height => pdf.font.height,
          :style => :bold,
          :overflow => :ellipses
        pdf.move_down 16
        
        pdf.fill_color = "767876"
        pdf.text "Distribution", :size => 16
        
        pdf.fill_color = "000000"
        distribution_text = species.distribution.size == 0 ? "None" : species.distribution.join(", ")
        pdf.text_box distribution_text,
          :at => [left + 40, pdf.cursor],
          :width => pdf.bounds.width - 40,
          :height => pdf.font.height * 2,
          :style => :bold,
          :overflow => :ellipses
        pdf.move_down 28
        
        pdf.fill_color = "767876"
        pdf.text "Abundance in Puget Sound", :size => 16
        
        pdf.fill_color = "000000"
        abundance_text = species.abundances.size == 0 ? "Not Available" : species.abundances.join(", ")
        pdf.text_box abundance_text,
          :at => [left + 40, pdf.cursor],
          :width => pdf.bounds.width - 40,
          :height => pdf.font.height,
          :style => :bold,
          :overflow => :ellipses
      end
    end
  end

  def back_box(species, index)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - (index * (pdf.bounds.height / 3))], :width => pdf.bounds.width, :height => pdf.bounds.height / 3 - 10 do
      stroke_rounded_rectangle
      
      pdf.bounding_box [pdf.bounds.left + 15, pdf.bounds.height - 15], :width => pdf.bounds.width - 30, :height => pdf.bounds.height do
        # Top, two-column box (scientific_name and synonyms)
        pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width, :height => pdf.font.height * 3 do
          # Scientific name
          pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width / 3, :height => pdf.bounds.height do  
            pdf.fill_color = "767876"
            pdf.text_box "Scientific Name", 
            :at => [pdf.bounds.left, pdf.bounds.top],
            :width => pdf.bounds.width,
            :height => pdf.font.height
            
            pdf.fill_color = "000000"
            pdf.text_box species.scientific_name, 
              :at => [pdf.bounds.left + 20, pdf.bounds.top - 14],
              :width => pdf.bounds.width - 20,
              :height => pdf.font.height * 2,
              :style => :bold_italic,
              :overflow => :ellipses
          end
          
          # Synonyms
          pdf.bounding_box [pdf.bounds.left + pdf.bounds.width / 3 + pdf.font.height, pdf.bounds.top], :width => pdf.bounds.width * 2 / 3 - pdf.font.height, :height => pdf.bounds.height do
            pdf.fill_color = "767876"
            pdf.text "Synonyms"
             
            pdf.fill_color = "000000"
            synonym_string = species.synonyms.size == 0 ? "None" : species.synonyms.join(", ")
            pdf.text_box(
              synonym_string, 
              :style => :bold_italic, 
              :overflow => :ellipses, 
              :at => [pdf.bounds.left + 20, pdf.bounds.top - pdf.font.height],
              :width => pdf.bounds.width - 20, 
            )

            
          end
        end
        pdf.move_down(4)
        
        top = pdf.bounds.top
        left = pdf.bounds.left
        line_height = pdf.font.height + 2
        
        pdf.fill_color = "767876"
        pdf.text "Taxonomy (Phylum, Class, Order, Family)"
        pdf.move_down 2
        
        pdf.fill_color = "000000"
        pdf.text_box species.taxonomy.to_s,
          :at => [left + 20, pdf.cursor],
          :width => pdf.bounds.width - 20,
          :height => line_height
        pdf.move_down line_height + 4
        
        
        pdf.fill_color = "767876"
        pdf.text "Similar species"
        pdf.move_down 2
        
        pdf.fill_color = "000000"
        
        if species.similar_species.size == 0
          similar_species_text = [{ :text => "None" }]
        else
          similar_species_text = species.similar_species.collect do |s|
            [
              { :text => s.scientific_name, :styles => [:italic] }, 
              { :text => " (#{s.first_common_name})" },
              { :text => ", " }
            ]
          end
          similar_species_text.flatten!.pop
        end
          
        pdf.formatted_text_box similar_species_text,
          :at => [left + 20, pdf.cursor],
          :width => pdf.bounds.width - 20,
          :height => line_height
        pdf.move_down line_height + 4
        
        
        pdf.fill_color = "767876"
        pdf.text "Distinguishing Characters"
        pdf.move_down 2
        
        pdf.fill_color = "000000"
        distinguishing_characters_text = species.distinguishing_characters.size == 0 ? "None" : species.distinguishing_characters.join("; ")
        pdf.text_box distinguishing_characters_text,
          :at => [left + 20, pdf.cursor],
          :width => pdf.bounds.width - 20,
          :height => line_height * 2
        pdf.move_down line_height * 2 + 4
        
        pdf.fill_color = "767876"
        pdf.text "Natural History Information"
        pdf.move_down 2
        
        pdf.fill_color = "000000"
        natural_histories_text = species.natural_histories.size == 0 ? "None" : species.natural_histories.join("; ")
        pdf.text_box natural_histories_text,
          :at => [left + 20, pdf.cursor],
          :width => pdf.bounds.width - 20,
          :height => line_height * 2
      end
    end
  end
  
  def stroke_rounded_rectangle
    @pdf.stroke_rounded_rectangle [pdf.bounds.left, pdf.bounds.top], pdf.bounds.width, pdf.bounds.height, 15
  end
end