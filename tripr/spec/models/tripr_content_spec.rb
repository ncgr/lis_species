require 'spec_helper'

describe TriprContent do
  
  it "has zero records" do
    TriprContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:tripr_content)
    TriprContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @tripr = TriprContent.new
    @tripr.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @tripr = TriprContent.new
    @tripr.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @tripr = TriprContent.new
    @tripr.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    TriprContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    TriprContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @tripr = TriprContent.new
    @pathogens = [] << Pathogen.new
    @tripr.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @tripr = TriprContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @tripr.attributes_empty?(@pathogens).should == true
  end
  
end
