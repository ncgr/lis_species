module PhavuContentsHelper

  NCBI_URL = "http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id="
  GRIN_URL = "http://www.ars-grin.gov/cgi-bin/npgs/html/taxon.pl?"

  #
  # Italicize species name.
  #
  def format_species_name(name)
    name = name.insert(0, '<em>')
    name.sub!('(', '</em>(')
    name.html_safe
  end

  #
  # Helper to add additional pathogens.
  #
  def add_pathogen_link(name, disabled = false)
    button_to_function name, :id => "add_pathogen", :disabled => disabled do |page|
      page.insert_html :bottom, :pathogens, :partial => "pathogens",
        :object => Pathogen.new
    end
  end

  #
  # Helper to add additional nodulators.
  #
  def add_nodulator_link(name, disabled = false)
    button_to_function name, :id => "add_nodulator", :disabled => disabled do |page|
      page.insert_html :bottom, :nodulators, :partial => "nodulators",
        :object => Nodulator.new
    end
  end

  #
  # Helper to add additional reference datasets.
  #
  def add_reference_dataset_link(name, disable = false)
    button_to_function name, :id => "add_reference_dataset", :disabled => disable do |page|
      page.insert_html :bottom, :reference_datasets, :partial => "reference_datasets",
        :object => ReferenceDataset.new
    end
  end

  #
  # Helper to add additional resources.
  #
  def add_resource_link(name, disabled = false)
    button_to_function name, :id => "add_resource", :disabled => disabled do |page|
      page.insert_html :bottom, :resources, :partial => "resources",
        :object => Resource.new
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
  # Parse object attributes into a three column table.
  #
  def parse_model_attributes(object, attributes = [])
    return "" unless attributes.length > 0

    i = 1
    data = "<table class='attributes-table'>"
    attributes.each do |a|
      unless object[a.to_sym].blank?
        i.modulo(2) == 0 ? style = "even" : style = "odd"
        data << "<tr class='#{style}'>"

        descriptor = a.humanize

        # Custom descriptor substitutions
        descriptor.gsub!(/(G|g)(C|c)/, 'GC')
        descriptor.gsub!(/accession/, 'NCBI accession')
        descriptor.gsub!(/(N|n)cbi/, 'NCBI')
        descriptor.gsub!(/(G|g)rin/, 'GRIN')
        descriptor.gsub!(/(S|s)elf incompatibility/, 'Mating system')

        ## Column One ##
        data << "<td>#{descriptor}</td>"

        # Custom values
        ## Column Two ##
        case a.to_sym
        when :ncbi_taxon_id
          data << "<td>#{link_to object[a.to_sym], NCBI_URL + object[a.to_sym]}</td>"
        when :grin_taxon_id
          data << "<td>#{link_to object[a.to_sym], GRIN_URL + object[a.to_sym]}</td>"
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
            "{autoOpen:false,show:'blind',hide:'blind',width:450});" +
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

    data.html_safe
  end

  #
  # Parse major pathogens into table.
  #
  def parse_major_pathogens(pathogens)
    i = 1
    data = "<table  class='pathogens-table'>"

    data << "<tr>"
    data << "<th>Pathogen</th>"
    data << "<th>NCBI Taxon ID</th>"
    data << "</tr>"

    pathogens.each do |p|
      i.modulo(2) == 0 ? style = "even" : style = "odd"
      data << "<tr class='#{style}'>"
      data << "<td>#{p.name unless p.name.blank?}</td>"
      data << "<td>#{link_to p.ncbi_taxon_id, NCBI_URL + p.ncbi_taxon_id unless p.ncbi_taxon_id.blank?}</td>"
      data << "</tr>"
      i += 1
    end
    data << "</table>"

    data.html_safe
  end

  #
  # Parse nodulators into table.
  #
  def parse_nodulators(nodulators)
    i = 1
    data = "<table  class='nodulators-table'>"

    data << "<tr>"
    data << "<th>Species</th>"
    data << "<th>NCBI Taxon ID</th>"
    data << "</tr>"

    nodulators.each do |n|
      i.modulo(2) == 0 ? style = "even" : style = "odd"
      data << "<tr class='#{style}'>"
      data << "<td>#{n.species unless n.species.blank?}</td>"
      data << "<td>#{link_to n.ncbi_taxon_id, NCBI_URL + n.ncbi_taxon_id unless n.ncbi_taxon_id.blank?}</td>"
      data << "</tr>"
      i += 1
    end
    data << "</table>"

    data.html_safe
  end

  #
  # Parse reference datasets into table.
  #
  def parse_reference_datasets(datasets)
    if datasets.size == 0
      data = "No reference datasets have been collected for this species. "
      data << "Please <a href=\"mailto:lis_feedback\@ncgr.org?subject=LIS%20Feedback\">contact us</a> "
      data << "to contribute data."
    else
      i = 1
      data = "<table  class='datasets-table'>"
  
      data << "<tr>"
      data << "<th>Type</th>"
      data << "<th>Description</th>"
      data << "<th>Source</th>"
      data << "<th>URL</th>"
      data << "</tr>"
  
      datasets.each do |d|
        i.modulo(2) == 0 ? style = "even" : style = "odd"
        data << "<tr class='#{style}'>"
        data << "<td>#{d.reference_dataset_type unless d.reference_dataset_type.blank?}</td>"
        data << "<td>#{d.description unless d.description.blank?}</td>"
        data << "<td>#{d.source unless d.source.blank?}</td>"
        data << "<td>#{link_to raw('Download &raquo;'), d.url unless d.url.blank?}</td>"
        data << "</tr>"
        i += 1
      end
      data << "</table>"
    end
    
    data.html_safe
  end

  #
  # Parse resources into table.
  #
  def parse_resources(resources)
    if resources.size == 0
      data = "There are no resources for this species"
    else
      data = "There are {resources.size} resources for this species"
      i = 1
      data << "<table  class='resources-table'>"
  
      resources.each do |r|
        i.modulo(2) == 0 ? style = "even" : style = "odd"
        data << "<tr class='#{style}'>"
        data << "<td>#{r.resource_type unless r.resource_type.blank?}</td>"
        data << "<td>#{r.description unless r.description.blank?}</td>"
        data << "<td>#{link_to raw('Linkout &raquo;'), r.url unless r.url.blank?}</td>"
        data << "</tr>"
        i += 1
      end
      data << "</table>"
    end
    
    data.html_safe
  end

  #
  # Parse QTLs into table.
  # param qtls: Array
  #
  def parse_qtls(qtls, qtl_experiments)
    if qtls.size == 0
      data = "There is no QTL data for this species."
    else
      data = "There are #{qtls.size} QTL records "
      data << "from #{qtl_experiments.size} experiments for this species"
      data << "<br><br>"
# need an Ajax call here to load QTL records into div 'qtl_list' below
#      data << "#{link_to \"See all QTL\", :url => show_qtl_list(), :update => :qtl_list, :remote => true}"
      
      data << "<table class='qtl-table'>"
      data << "<tr>"
      data << "<td><b>Expriment Name</b></td>"
      data << "<td><b>Citation</b></td>";
      data << "<td><b>QTL count</b></td>";
      data << "<tr>"
      
      qtl_experiments.each do |r|
        data << "<tr>"
        data << "<td>#{r.ename unless r.ename.blank?}</td>"
        data << "<td>tdb</td>"
        data << "<td>tbd</td>"
        data << "<tr>"
      end
      
      data << "</table>"
      
      data << "<div id=\"qtl_list\"></div>"
    end

    data.html_safe  # required
  end # parse_qtls()


  #
  # Show all QTL records for this species
  #
  def show_qtl_list()
    data "<i>List will go here</i>"
    data.html_safe
  end # show_qtl_list()
  
    
  #
  # Parse markers into table.
  # param qtls: Array
  #
  def parse_markers(markers)
    if markers.size == 0
      data = "There is no marker data for this species."
    else
      data = "<table class='marker-table'>"
      data << "<tr>"
      data << "<td><b>name</b></td>"
      data << "<td><b><i>et cetera</i></b></td>";
      data << "<tr>"
      
      qtls.each do |r|
        data << "<tr>"
        data << "<td>#{r.marker_name unless r.marker_name.blank?}</td>"
        data << "<td>...</td>"
        data << "<tr>"
      end
      
      data << "</table>"
    end

    data.html_safe  # indicates that html is safe to display
  end # parse_markers()
  
end
