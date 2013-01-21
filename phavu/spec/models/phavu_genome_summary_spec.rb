require 'spec_helper'

describe PhavuGenomeSummary do
  it "has zero records" do
    PhavuGenomeSummary.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:phavu_genome_summary)
    PhavuGenomeSummary.count.should == 1
  end

  it "removes % after self.gc_content_genome" do
    ags = PhavuContent.new.build_phavu_genome_summary({
      :phavu_content_id => 1,
      :gc_content_genome => '22.5%'
    })
    ags.save
    ags.gc_content_genome.should == '22.5'
  end

  it "removes % after self.gc_content_transcriptome" do
    ags = PhavuContent.new.build_phavu_genome_summary({
      :phavu_content_id => 1,
      :gc_content_transcriptome => '78%'
    })
    ags.save
    ags.gc_content_transcriptome.should == '78'
  end
end
