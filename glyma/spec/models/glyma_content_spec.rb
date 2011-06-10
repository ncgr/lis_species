require 'spec_helper'

describe GlymaContent do
  
  it "has zero records" do
    GlymaContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:glyma_content)
    GlymaContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @glyma = GlymaContent.new
    @glyma.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @glyma = GlymaContent.new
    @glyma.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @glyma = GlymaContent.new
    @glyma.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    GlymaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    GlymaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @glyma = GlymaContent.new
    @pathogens = [] << Pathogen.new
    @glyma.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @glyma = GlymaContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @glyma.attributes_empty?(@pathogens).should == true
  end
  
end