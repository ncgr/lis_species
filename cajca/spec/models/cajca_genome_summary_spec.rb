require 'spec_helper'

describe CajcaGenomeSummary do
  it "has zero records" do
    CajcaGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:cajca_genome_summary)
    CajcaGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    ags = CajcaContent.new.build_cajca_genome_summary({
      :cajca_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = CajcaContent.new.build_cajca_genome_summary({
      :cajca_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save
    ags.gc_content_transcriptome.should == '78'
  end
end
