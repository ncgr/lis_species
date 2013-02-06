require 'spec_helper'

describe MedsaGenomeSummary do
  it "has zero records" do
    MedsaGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:medsa_genome_summary)
    MedsaGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    ags = MedsaGenomeSummary.new({
      :medsa_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save!
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = MedsaGenomeSummary.new({
      :medsa_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save!
    ags.gc_content_transcriptome.should == '78'
  end
end
