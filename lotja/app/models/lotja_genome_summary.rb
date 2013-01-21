class LotjaGenomeSummary < ActiveRecord::Base
  belongs_to :lotja_content

  attr_accessible :genome_summary, :chromosomes, :genome_size,
    :genome_size_information, :ploidy_type, :gc_content_genome,
    :gc_content_genome_information, :gc_content_transcriptome,
    :gc_content_transcriptome_information, :chloroplast_genome_size,
    :chloroplast_genome_size_information, :chloroplast_accession_number,
    :mitochondria_genome_size, :mitochondria_genome_size_information,
    :mitochondria_accession_number, :lotja_content_id

  before_save :clean_attribute_values

  #
  # Cleans attribute values.
  #
  def clean_attribute_values
    self.gc_content_genome.gsub!('%', '') unless self.gc_content_genome.blank?
    self.gc_content_transcriptome.gsub!('%', '') unless self.gc_content_transcriptome.blank?
  end

end
