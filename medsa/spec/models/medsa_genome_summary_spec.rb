require 'spec_helper'

describe MedsaGenomeSummary do
  it "has zero records" do
    MedsaGenomeSummary.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:medsa_genome_summary)
    MedsaGenomeSummary.count.should == 1
  end
  
  it "removes % after self.gc_content_genome" do
    @medsa_genome_summary = MedsaGenomeSummary.create!({:medsa_content_id => 1, :gc_content_genome => '22.5%'})
    @medsa_genome_summary.gc_content_genome.should == '22.5'
  end
  
  it "removes % after self.gc_content_transcriptome" do
    @medsa_genome_summary = MedsaGenomeSummary.create!({:medsa_content_id => 1, :gc_content_transcriptome => '78%'})
    @medsa_genome_summary.gc_content_transcriptome.should == '78'
  end
end
