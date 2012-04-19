require 'spec_helper'

describe LupalGenomeSummary do
  it "has zero records" do
    LupalGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:lupal_genome_summary)
    LupalGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    @lupal_genome_summary = LupalGenomeSummary.create!({
      :lupal_content_id => 1, :gc_content_genome => '22.5%'
    })
    @lupal_genome_summary.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    @lupal_genome_summary = LupalGenomeSummary.create!({
      :lupal_content_id => 1, :gc_content_transcriptome => '78%'
    })
    @lupal_genome_summary.gc_content_transcriptome.should == '78'
  end
end
