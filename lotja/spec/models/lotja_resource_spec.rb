require 'spec_helper'

describe LotjaResource do
  it "has zero records" do
    LotjaResource.count.should == 0
  end
  
  it "has one record" do
    Factory.create(:lotja_resource)
    LotjaResource.count.should == 1
  end
end