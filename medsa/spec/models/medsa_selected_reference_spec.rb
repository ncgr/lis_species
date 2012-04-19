require 'spec_helper'

describe MedsaSelectedReference do
  it "has zero records" do
    MedsaSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:medsa_selected_reference)
    MedsaSelectedReference.count.should == 1
  end
end
