
class VicfaContent < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :legume
  has_one     :vicfa_resource
  has_one     :vicfa_genome_summary
  has_one     :vicfa_selected_reference
  
  has_many :pathogens, 
    :primary_key => "legume_id", 
    :foreign_key => "legume_id",
    :dependent => :destroy
  has_many :reference_datasets, 
    :primary_key => "legume_id", 
    :foreign_key => "legume_id",
    :dependent => :destroy
  has_many :resources, 
    :primary_key => "legume_id", 
    :foreign_key => "legume_id",
    :dependent => :destroy
  
  accepts_nested_attributes_for :vicfa_selected_reference, 
    :vicfa_genome_summary, :update_only => true
  
  validates_associated :resources, :reference_datasets
  validates_format_of :wiki_link, :with => URI::regexp(%w(http https)),
    :allow_blank => true, :message => ' is not valid. Please include a valid protocol.'
  
  before_save :clean_attribute_values
  after_update :save_pathogens, :save_reference_datasets, :save_resources

  #
  # Build submitted pathogen attributes.
  #
  def new_pathogens_attributes=(pathogens_attributes)
    pathogens_attributes.each do |a|
      pathogens.build(a) unless attributes_empty?(a)
    end
  end
  
  #
  # Edit pathogen attributes.
  #
  def existing_pathogens_attributes=(pathogens_attributes)
    pathogens.reject(&:new_record?).each do |pathogen|
      attributes = pathogens_attributes[pathogen.id.to_s]
      if attributes && !attributes_empty?(attributes)
        pathogen.attributes = attributes
      else
        pathogens.delete(pathogen)
      end
    end
  end
  
  #
  # Save the edits after update.
  #
  def save_pathogens
    pathogens.each do |p|
      p.save(:validate => false)
    end
  end
  
  #
  # Build submitted reference datasets attributes.
  #
  def new_reference_datasets_attributes=(reference_datasets_attributes)
    reference_datasets_attributes.each do |a|
      reference_datasets.build(a) unless attributes_empty?(a)
    end
  end
  
  #
  # Edit reference datasets attributes.
  #
  def existing_reference_datasets_attributes=(reference_datasets_attributes)
    reference_datasets.reject(&:new_record?).each do |reference_dataset|
      attributes = reference_datasets_attributes[reference_dataset.id.to_s]
      if attributes && !attributes_empty?(attributes)
        reference_dataset.attributes = attributes
      else
        reference_datasets.delete(reference_dataset)
      end
    end
  end
  
  #
  # Save the edits after update.
  #
  def save_reference_datasets
    reference_datasets.each do |r|
      r.save(:validate => false)
    end
  end
  
  #
  # Build submitted resources attributes.
  #
  def new_resources_attributes=(resources_attributes)
    resources_attributes.each do |a|
      resources.build(a) unless attributes_empty?(a)
    end
  end
  
  #
  # Edit resources attributes.
  #
  def existing_resources_attributes=(resources_attributes)
    resources.reject(&:new_record?).each do |resource|
      attributes = resources_attributes[resource.id.to_s]
      if attributes && !attributes_empty?(attributes)
        resource.attributes = attributes
      else
        resources.delete(resource)
      end
    end
  end
  
  #
  # Save the edits after update.
  #
  def save_resources
    resources.each do |r|
      r.save(:validate => false)
    end
  end
  
  #
  # Cleans attribute values.
  #
  def clean_attribute_values
    
  end
  
  #
  # Are the attributes empty?
  #
  def attributes_empty?(a)
    a.each do |k, v|
      return false unless v.blank?
    end
    true
  end

end
