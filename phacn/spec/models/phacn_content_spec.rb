require 'spec_helper'

describe PhacnContent do
  
  it "has zero records" do
    PhacnContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:phacn_content)
    PhacnContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @phacn = PhacnContent.new
    @phacn.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @phacn = PhacnContent.new
    @phacn.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @phacn = PhacnContent.new
    @phacn.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    PhacnContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    PhacnContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @phacn = PhacnContent.new
    @pathogens = [] << Pathogen.new
    @phacn.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @phacn = PhacnContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @phacn.attributes_empty?(@pathogens).should == true
  end
  
end
