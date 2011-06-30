require 'spec_helper'

describe VigraGenomeSummary do
  it "has zero records" do
    VigraGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:vigra_genome_summary)
    VigraGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @vigra_genome_summary = VigraGenomeSummary.create!({:vigra_content_id => 1, :gc_content_genome => '22.5%'})
    @vigra_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @vigra_genome_summary = VigraGenomeSummary.create!({:vigra_content_id => 1, :gc_content_transcriptome => '78%'})
    @vigra_genome_summary.gc_content_transcriptome.should == '78'
  end
end
