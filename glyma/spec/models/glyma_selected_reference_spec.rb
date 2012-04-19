require 'spec_helper'

describe GlymaSelectedReference do
  it "has zero records" do
    GlymaSelectedReference.count.should == 0
  end

  it "has one record" do
    FactoryGirl.create(:glyma_selected_reference)
    GlymaSelectedReference.count.should == 1
  end
end
