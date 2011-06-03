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
  
  it "fails validation on poorly formatted origin_lat (using errors_on)" do
    LotjaContent.new({
      :origin_lat => 0.0
    }).should have(1).error_on(:origin_lat)
  end
  
  it "fails validation on poorly formatted origin_long (using errors_on)" do
    LotjaContent.new({
      :origin_long => 0.0
    }).should have(1).error_on(:origin_long)
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    LotjaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted origin_lat (using errors_on)" do
    LotjaContent.new({
      :origin_lat => 1.2233
    }).should have(0).error_on(:origin_lat)
  end
  
  it "passes validation with properly formatted origin_long (using errors_on)" do
    LotjaContent.new({
      :origin_long => 101.123456
    }).should have(0).error_on(:origin_long)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    LotjaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "data file directory exists" do
    File.directory?(LotjaContent::DATA_FILE_ROOT).should == true
  end
  
  it "removes % after self.inbreeding" do
    @lotja = LotjaContent.create!({:legume_id => 1, :inbreeding => '12.45%'})
    @lotja.inbreeding.should == '12.45'
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