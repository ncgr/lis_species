require 'spec_helper'

describe MedsaContent do

  it "has zero records" do
    MedsaContent.count.should == 0
  end

  it "passes validation with no params" do
    FactoryGirl.create(:medsa_content)
    MedsaContent.count.should == 1
  end

  it "should respond to pathogens" do
    @medsa = MedsaContent.new
    @medsa.respond_to?(:pathogens).should == true
  end

  it "should respond to reference_datasets" do
    @medsa = MedsaContent.new
    @medsa.respond_to?(:reference_datasets).should == true
  end

  it "should respond to resources" do
    @medsa = MedsaContent.new
    @medsa.respond_to?(:resources).should == true
  end

  it "fails validation on poorly formatted wiki_link (using errors_on)" do
    MedsaContent.new({
      :wiki_link => 'htp://en.wikipedia.org'
    }).should have(1).error_on(:wiki_link)
  end

  it "passes validation with properly formatted wiki_link (using errors_on)" do
    MedsaContent.new({
      :wiki_link => 'http://en.wikipedia.org'
    }).should have(0).error_on(:wiki_link)
  end

  it "returns true if attributes are empty" do
    @medsa = MedsaContent.new
    @medsa.attributes_empty?({}).should == true
  end

  it "returns false if attributes are not empty" do
    @medsa = MedsaContent.new
    @medsa.attributes_empty?({ "key"=>"val" }).should == false
  end

end
