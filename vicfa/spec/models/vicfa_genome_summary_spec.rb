require 'spec_helper'

describe VicfaGenomeSummary do
  it "has zero records" do
    VicfaGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:vicfa_genome_summary)
    VicfaGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @vicfa_genome_summary = VicfaGenomeSummary.create!({:vicfa_content_id => 1, :gc_content_genome => '22.5%'})
    @vicfa_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @vicfa_genome_summary = VicfaGenomeSummary.create!({:vicfa_content_id => 1, :gc_content_transcriptome => '78%'})
    @vicfa_genome_summary.gc_content_transcriptome.should == '78'
  end
end
