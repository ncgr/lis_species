require 'spec_helper'

describe VigunGenomeSummary do
  it "has zero records" do
    VigunGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:vigun_genome_summary)
    VigunGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    ags = VigunGenomeSummary.new({
      :vigun_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save!
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = VigunGenomeSummary.new({
      :vigun_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save!
    ags.gc_content_transcriptome.should == '78'
  end
end
