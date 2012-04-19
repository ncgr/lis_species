require 'spec_helper'

describe LencuContent do

  it "has zero records" do
    LencuContent.count.should == 0
  end

  it "passes validation with no params" do
    FactoryGirl.create(:lencu_content)
    LencuContent.count.should == 1
  end

  it "should respond to pathogens" do
    @lencu = LencuContent.new
    @lencu.respond_to?(:pathogens).should == true
  end

  it "should respond to reference_datasets" do
    @lencu = LencuContent.new
    @lencu.respond_to?(:reference_datasets).should == true
  end

  it "should respond to resources" do
    @lencu = LencuContent.new
    @lencu.respond_to?(:resources).should == true
  end

  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    LencuContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end

  it "passes validation with properly formatted wiki_link (using errors_on)" do
    LencuContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end

  it "returns true if attributes are empty" do
    @lencu = LencuContent.new
    @lencu.attributes_empty?({}).should == true
  end

  it "returns false if attributes are not empty" do
    @lencu = LencuContent.new
    @lencu.attributes_empty?({ "key"=>"val" }).should == false
  end

end
