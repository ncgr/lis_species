require 'spec_helper'

describe ArahySelectedReference do
  it "has zero records" do
    ArahySelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:arahy_selected_reference)
    ArahySelectedReference.count.should == 1
  end
end
