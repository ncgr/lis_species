require 'spec_helper'

describe ArahyGenomeSummary do
  it "has zero records" do
    ArahyGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:arahy_genome_summary)
    ArahyGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    @arahy_genome_summary = ArahyGenomeSummary.create!({
      :arahy_content_id => 1, :gc_content_genome => '22.5%'
    })
    @arahy_genome_summary.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    @arahy_genome_summary = ArahyGenomeSummary.create!({
      :arahy_content_id => 1, :gc_content_transcriptome => '78%'
    })
    @arahy_genome_summary.gc_content_transcriptome.should == '78'
  end
end
