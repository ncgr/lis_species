require 'spec_helper'

describe VigunContent do
  
  it "has zero records" do
    VigunContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:vigun_content)
    VigunContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @vigun = VigunContent.new
    @vigun.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @vigun = VigunContent.new
    @vigun.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @vigun = VigunContent.new
    @vigun.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    VigunContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    VigunContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @vigun = VigunContent.new
    @pathogens = [] << Pathogen.new
    @vigun.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @vigun = VigunContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @vigun.attributes_empty?(@pathogens).should == true
  end
  
end
