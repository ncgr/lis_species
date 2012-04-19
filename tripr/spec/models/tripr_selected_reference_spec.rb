require 'spec_helper'

describe TriprSelectedReference do
  it "has zero records" do
    TriprSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:tripr_selected_reference)
    TriprSelectedReference.count.should == 1
  end
end
