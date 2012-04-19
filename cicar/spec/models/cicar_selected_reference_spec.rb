require 'spec_helper'

describe CicarSelectedReference do
  it "has zero records" do
    CicarSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:cicar_selected_reference)
    CicarSelectedReference.count.should == 1
  end
end
