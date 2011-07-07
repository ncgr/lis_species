require 'spec_helper'

describe Nodulator do
  it "has zero records" do
    Nodulator.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:nodulator)
    Nodulator.count.should == 1
  end
end
