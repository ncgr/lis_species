require 'spec_helper'

describe ChafsGenomeSummary do
  it "has zero records" do
    ChafsGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:chafs_genome_summary)
    ChafsGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    @chafs_genome_summary = ChafsGenomeSummary.create!({
      :chafs_content_id => 1, :gc_content_genome => '22.5%'
    })
    @chafs_genome_summary.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    @chafs_genome_summary = ChafsGenomeSummary.create!({
      :chafs_content_id => 1, :gc_content_transcriptome => '78%'
    })
    @chafs_genome_summary.gc_content_transcriptome.should == '78'
  end
end
