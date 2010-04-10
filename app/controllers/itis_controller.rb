class ItisController < ApplicationController
  respond_to :json
  
  def taxonomy
    @tsn = tsn_from_binomial_name(params[:binomial_name])
    
    if @tsn
      @taxonomy = taxonomy_from_tsn(@tsn)
    else
      @taxonomy = {}
    end
    
    respond_with(@taxonomy.to_json, :status => :ok)
  end
  
  protected
  def tsn_from_binomial_name(name)
    doc = Nokogiri::XML(open("http://www.cbif.gc.ca/pls/itisca/taxastep?hierarchy=y&king=every&p_action=containing&taxa=#{name.gsub(" ", "+")}&p_format=xml&p_ifx=cbif"))
    tsn = doc.css("tsn")
    
    tsn.length > 1 ? tsn.first.content : nil
  end
  
  def taxonomy_from_tsn(tsn)
    @taxonomy = {}
    
    doc = Nokogiri::XML(open("http://www.cbif.gc.ca/pls/itisca/taxa_xml.upwards?p_tsn=#{tsn}&p_type=y"))
    
    doc.css("parent").each do |taxon|
      rank = taxon.at("rank").content.downcase
      rank = "klass" if rank == "class"
      name = taxon.at("concatenatedname").content
      @taxonomy[rank.to_sym] = name
    end
    
    @taxonomy
  end
end
