require 'spec_helper'

describe LotjaGenomeSummary do
  it "has zero records" do
    LotjaGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:lotja_genome_summary)
    LotjaGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    @lotja_genome_summary = LotjaGenomeSummary.create!({
      :lotja_content_id => 1, :gc_content_genome => '22.5%'
    })
    @lotja_genome_summary.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    @lotja_genome_summary = LotjaGenomeSummary.create!({
      :lotja_content_id => 1, :gc_content_transcriptome => '78%'
    })
    @lotja_genome_summary.gc_content_transcriptome.should == '78'
  end
end
