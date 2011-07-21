require 'spec_helper'

describe LotjaContent do
  
  it "has zero records" do
    LotjaContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:lotja_content)
    LotjaContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @lotja = LotjaContent.new
    @lotja.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @lotja = LotjaContent.new
    @lotja.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @lotja = LotjaContent.new
    @lotja.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    LotjaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    LotjaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @lotja = LotjaContent.new
    @pathogens = [] << Pathogen.new
    @lotja.attributes_empty?(@pathogens).should == true
  end
  
  it "returns false if attributes are not empty" do
    @lotja = LotjaContent.new
    @pathogens = [] << Factory.build(:pathogen)
    @lotja.attributes_empty?(@pathogens).should == true
  end
  
end
