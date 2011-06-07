module LotjaContentsHelper
  
  #
  # Helper to add additional pathogens.
  #
  def add_pathogen_link(name)
    button_to_function name, :id => "add_pathogen" do |page|
      page.insert_html :bottom, :pathogens, :partial => "pathogens", 
            :object => Pathogen.new
    end
  end
  
  #
  # Fields for helper.
  #
  def fields_for_form(name, object, &block)
    new_or_existing = object.new_record? ? 'new' : 'existing'
    model = controller.class.to_s.sub('Controller','').singularize.underscore
    prefix = model + "[#{new_or_existing}_#{name}_attributes][]"
    fields_for(prefix, object, &block)
  end
  
  #
  # Parse the data file into a table.
  #
  def parse_data_file(data_file)
    return "" if data_file.blank?
    
    i = 1
    data = "<table id='datasets'>"
    
    # Set the headers
    headers = data_file.shift
    data << "<tr>"
    headers.split("|").each do |h|
      data << "<th>#{h.strip}</th>"
    end
    data << "</tr>"
    
    # Set the data
    data_file.each do |d|
      i.modulo(2) == 0 ? style = "even" : style = "odd"
      data << "<tr class='#{style}'>"
      d.split("|").each do |l|
        data << "<td>#{l.strip}</td>"
      end
      data << "</tr>"
      i += 1
    end
    data << "</table>"
    
    # Send the table
    raw(data)
  end
  
  #
  # Parse object attributes into table.
  #
  def parse_model_attributes(object, attributes = [])
    return "" unless attributes.length > 0
    
    i = 1
    data = "<table>"
    attributes.each do |a|
      unless object[a.to_sym].blank?
        i.modulo(2) == 0 ? style = "even" : style = "odd"
        data << "<tr class='#{style}'>"
        
        descriptor = a.humanize
        
        # Custom descriptor substitutions
        descriptor.gsub!(/(G|g)(C|c)/, 'GC')
        descriptor.gsub!(/accession/, 'NCBI accession')
        descriptor.gsub!(/(T|t)axon/, 'NCBI taxon ID')
        descriptor.gsub!(/(S|s)elf incompatibility/, 'Mating system')
        
        ## Column One ##
        data << "<td>#{descriptor}</td>"
        
        # Custom values
        ## Column Two ##
        case a.to_sym
          when :gc_content_genome
            data << "<td>#{object[a.to_sym]}%</td>"
          when :gc_content_transcriptome
            data << "<td>#{object[a.to_sym]}%</td>"
          when :genome_size
            data << "<td>#{object[a.to_sym]} (Mbp)</td>"
          when :chloroplast_genome_size
            data << "<td>#{object[a.to_sym]} (kbp)</td>"
          when :mitochondria_genome_size
            data << "<td>#{object[a.to_sym]} (kbp)</td>"
          else
            data << "<td>#{object[a.to_sym]}</td>"
        end
        
        information = "#{a}_information".to_sym
        # If the attribute has additional information, add the dialog box.
        ## Column Three ##
        unless object[information].blank?
          data << "<td>"
          details = object[information]
          title = information.to_s.humanize.gsub(/(G|g)(C|c)/, 'GC')
          # Text container
          data << "<div id='#{a}_information_dialog' title='#{title}'>#{details}</div>"
          data << " <a id='#{a}_information_opener' href='#'>Read More &raquo;</a>"
          # jQuery dialog box
          data << "<script>$j(function($){$('##{a}_information_dialog').dialog(" + 
            "{autoOpen:false,show:'blind',hide:'blind',width:400});" + 
            "$('##{a}_information_opener').click(function(){" + 
            "$('##{a}_information_dialog').dialog('open');return false;});});" + 
            "</script>"
          data << "</td>"
        else
          data << "<td></td>"
        end
        data << "</tr>"
        i += 1
      end
    end
    data << "</table>"
    
    # Send the table
    raw(data)
  end
  
  #
  # Parse major pathogens into table.
  #
  def parse_major_pathogens(pathogens)
    i = 1
    data = "<table id='pathogens'>"
    
    data << "<tr>"
    data << "<th>Pathogen</th>"
    data << "<th>NCBI Taxon ID</th>"
    data << "</tr>"
    
    pathogens.each do |p|
      i.modulo(2) == 0 ? style = "even" : style = "odd"
      data << "<tr class='#{style}'>"
      data << "<td>#{p.name unless p.name.blank?}</td>"
      data << "<td>#{p.ncbi_taxon_id unless p.ncbi_taxon_id.blank?}</td>"
      data << "</tr>"
      i += 1
    end
    data << "</table>"
    
    # Send the table
    raw(data)
  end
  
  
end