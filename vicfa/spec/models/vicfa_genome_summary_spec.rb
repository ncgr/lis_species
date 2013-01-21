require 'spec_helper'

describe VicfaGenomeSummary do
  it "has zero records" do
    VicfaGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:vicfa_genome_summary)
    VicfaGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    ags = VicfaContent.new.build_vicfa_genome_summary({
      :vicfa_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = VicfaContent.new.build_vicfa_genome_summary({
      :vicfa_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save
    ags.gc_content_transcriptome.should == '78'
  end
end
