require 'spec_helper'

describe CajcaContent do
  
  it "has zero records" do
    CajcaContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:cajca_content)
    CajcaContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @cajca = CajcaContent.new
    @cajca.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @cajca = CajcaContent.new
    @cajca.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @cajca = CajcaContent.new
    @cajca.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    CajcaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    CajcaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @cajca = CajcaContent.new
    @pathogens = [] << Pathogen.new
    @cajca.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @cajca = CajcaContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @cajca.attributes_empty?(@pathogens).should == true
  end
  
end
