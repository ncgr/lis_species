class GlymaContent < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :legume
  has_one     :glyma_resource
  has_one     :glyma_genome_summary
  has_one     :glyma_selected_reference

  has_many :pathogens,
    :primary_key => "legume_id",
    :foreign_key => "legume_id",
    :dependent => :destroy
  has_many :nodulators,
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

  attr_accessible :overview, :ncbi_taxon_id, :grin_taxon_id, :special_interest,
    :nodulation_type, :nodulation_type_information, :flowering_type,
    :flowering_type_information, :pollination_type,
    :pollination_type_information, :self_incompatibility,
    :inbreeding, :wiki_link, :updated_at, :user_id, :maps,
    :new_pathogens_attributes, :existing_pathogens_attributes,
    :new_nodulators_attributes, :existing_nodulators_attributes,
    :new_reference_datasets_attributes, :existing_reference_datasets_attributes,
    :new_resources_attributes, :existing_resources_attributes,
    :glyma_genome_summary_attributes, :glyma_selected_reference_attributes

  accepts_nested_attributes_for :glyma_selected_reference,
    :glyma_genome_summary, :update_only => true

  validates_associated :resources, :reference_datasets
  validates_format_of :wiki_link, :with => URI::regexp(%w(http https)),
    :allow_blank => true, :message => ' is not valid. Please include a valid protocol.'

  after_update :save_pathogens, :save_nodulators, :save_reference_datasets,
    :save_resources

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
  # Build submitted nodulator attributes.
  #
  def new_nodulators_attributes=(nodulators_attributes)
    nodulators_attributes.each do |a|
      nodulators.build(a) unless attributes_empty?(a)
    end
  end

  #
  # Edit nodulator attributes.
  #
  def existing_nodulators_attributes=(nodulators_attributes)
    nodulators.reject(&:new_record?).each do |nodulator|
      attributes = nodulators_attributes[nodulator.id.to_s]
      if attributes && !attributes_empty?(attributes)
        nodulator.attributes = attributes
      else
        nodulators.delete(nodulator)
      end
    end
  end

  #
  # Save the edits after update.
  #
  def save_nodulators
    nodulators.each do |p|
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
  # Are the attributes empty?
  #
  def attributes_empty?(a)
    a.each do |k, v|
      return false unless v.blank?
    end
    true
  end

end
