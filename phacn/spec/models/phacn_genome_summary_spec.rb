require 'spec_helper'

describe PhacnGenomeSummary do
  it "has zero records" do
    PhacnGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:phacn_genome_summary)
    PhacnGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @phacn_genome_summary = PhacnGenomeSummary.create!({:phacn_content_id => 1, :gc_content_genome => '22.5%'})
    @phacn_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @phacn_genome_summary = PhacnGenomeSummary.create!({:phacn_content_id => 1, :gc_content_transcriptome => '78%'})
    @phacn_genome_summary.gc_content_transcriptome.should == '78'
  end
end
