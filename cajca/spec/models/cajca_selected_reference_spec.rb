require 'spec_helper'

describe CajcaSelectedReference do
  it "has zero records" do
    CajcaSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:cajca_selected_reference)
    CajcaSelectedReference.count.should == 1
  end
end
