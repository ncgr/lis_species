require 'spec_helper'

describe LupanSelectedReference do
  it "has zero records" do
    LupanSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:lupan_selected_reference)
    LupanSelectedReference.count.should == 1
  end
end
