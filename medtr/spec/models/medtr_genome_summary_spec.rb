require 'spec_helper'

describe MedtrGenomeSummary do
  it "has zero records" do
    MedtrGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:medtr_genome_summary)
    MedtrGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @medtr_genome_summary = MedtrGenomeSummary.create!({:medtr_content_id => 1, :gc_content_genome => '22.5%'})
    @medtr_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @medtr_genome_summary = MedtrGenomeSummary.create!({:medtr_content_id => 1, :gc_content_transcriptome => '78%'})
    @medtr_genome_summary.gc_content_transcriptome.should == '78'
  end
end
