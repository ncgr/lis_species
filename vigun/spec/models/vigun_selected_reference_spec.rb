require 'spec_helper'

describe VigunSelectedReference do
  it "has zero records" do
    VigunSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:vigun_selected_reference)
    VigunSelectedReference.count.should == 1
  end
end
