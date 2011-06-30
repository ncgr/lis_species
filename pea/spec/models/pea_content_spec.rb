require 'spec_helper'

describe PeaContent do
  
  it "has zero records" do
    PeaContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:pea_content)
    PeaContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @pea = PeaContent.new
    @pea.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @pea = PeaContent.new
    @pea.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @pea = PeaContent.new
    @pea.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    PeaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    PeaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @pea = PeaContent.new
    @pathogens = [] << Pathogen.new
    @pea.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @pea = PeaContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @pea.attributes_empty?(@pathogens).should == true
  end
  
end
