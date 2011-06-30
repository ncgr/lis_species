require 'spec_helper'

describe LencuGenomeSummary do
  it "has zero records" do
    LencuGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:lencu_genome_summary)
    LencuGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @lencu_genome_summary = LencuGenomeSummary.create!({:lencu_content_id => 1, :gc_content_genome => '22.5%'})
    @lencu_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @lencu_genome_summary = LencuGenomeSummary.create!({:lencu_content_id => 1, :gc_content_transcriptome => '78%'})
    @lencu_genome_summary.gc_content_transcriptome.should == '78'
  end
end
