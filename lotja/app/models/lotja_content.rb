
class LotjaContent < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :legume
  has_one     :lotja_resource
  has_one     :lotja_genome_summary
  has_one     :lotja_selected_reference
  
  has_many :pathogens, 
    :primary_key => "legume_id", 
    :foreign_key => "legume_id",
    :dependent => :destroy
  
  DATA_FILE_ROOT = ::Rails.root.to_s + "/data/"
  
  validates_format_of :origin_lat, :with => /^[-+]?\d{1,3}\.\d{2,6}$/,
    :allow_blank => true, :message => ' not valid'
  validates_format_of :origin_long, :with => /^[-+]?\d{1,3}\.\d{2,6}$/,
    :allow_blank => true, :message => ' not valid'
  validates_format_of :wiki_link, :with => URI::regexp(%w(http https)),
    :allow_blank => true, :message => ' is not valid. Please include http(s)://'
  
  before_save :clean_attribute_values
  after_update :save_pathogens

  #
  # Upload the data file for Reference Datasets.
  #
  def upload_data_file(file)
    # Check content type and file extension.
    file_ext = File.extname(File.basename(file.original_filename)).downcase
    content_type = file.content_type.downcase
    if file_ext != '.txt' || content_type != 'text/plain'
      raise RuntimeError, "File extension and Content-Type must be .txt and text/plain."
    end
    
    name = self.class.to_s.downcase + '.txt'
    self.file_name = name
    File.open("#{DATA_FILE_ROOT}#{name}", 'w') {|f| f.write(file.read)}
  end
  
  #
  # Read data file
  #
  def read_data_file
    data = []
    return data if self.file_name.blank?
    
    file = DATA_FILE_ROOT + self.file_name
    if File.exists?(file) && File.readable?(file)
      data = File.readlines(file)
      data.each {|l| l.chomp!}
    end
    data
  end
  
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
  # Cleans attribute values.
  #
  def clean_attribute_values
    self.inbreeding.gsub!('%', '') unless self.inbreeding.blank?
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