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
    ags = LupalContent.new.build_lupal_genome_summary({
      :lupal_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = LupalContent.new.build_lupal_genome_summary({
      :lupal_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save
    ags.gc_content_transcriptome.should == '78'
  end
end
