require 'spec_helper'

describe LupalContent do
  
  it "has zero records" do
    LupalContent.count.should == 0
  end
  
  it "passes validation with no params" do
    Factory.create(:lupal_content)
    LupalContent.count.should == 1
  end
  
  it "should respond to pathogens" do
    @lupal = LupalContent.new
    @lupal.respond_to?(:pathogens).should == true
  end
  
  it "should respond to reference_datasets" do
    @lupal = LupalContent.new
    @lupal.respond_to?(:reference_datasets).should == true
  end
  
  it "should respond to resources" do
    @lupal = LupalContent.new
    @lupal.respond_to?(:resources).should == true
  end
  
  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    LupalContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end
  
  it "passes validation with properly formatted wiki_link (using errors_on)" do
    LupalContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end
  
  it "returns true if attributes are empty" do
    @lupal = LupalContent.new
    @lupal.attributes_empty?({}).should == true
  end
  
  it "returns false if attributes are not empty" do
    @lupal = LupalContent.new
    @lupal.attributes_empty?({"key"=>"val"}).should == false 
  end
  
end
