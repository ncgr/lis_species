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
  
end