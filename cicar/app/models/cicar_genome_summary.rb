
class CicarGenomeSummary < ActiveRecord::Base
  belongs_to :cicar_content
  
  before_save :clean_attribute_values
  
  #
  # Cleans attribute values.
  #
  def clean_attribute_values
    self.gc_content_genome.gsub!('%', '') unless self.gc_content_genome.blank?
    self.gc_content_transcriptome.gsub!('%', '') unless self.gc_content_transcriptome.blank?
  end
  
end
