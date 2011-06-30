require 'spec_helper'

describe PhavuContent do
  
  it "has zero records" do
    PhavuContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:phavu_content)
    PhavuContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @phavu = PhavuContent.new
    @phavu.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @phavu = PhavuContent.new
    @phavu.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @phavu = PhavuContent.new
    @phavu.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    PhavuContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    PhavuContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @phavu = PhavuContent.new
    @pathogens = [] << Pathogen.new
    @phavu.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @phavu = PhavuContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @phavu.attributes_empty?(@pathogens).should == true
  end
  
end
