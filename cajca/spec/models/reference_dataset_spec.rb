require 'spec_helper'

describe ReferenceDataset do
  it "has zero records" do
    ReferenceDataset.count.should == 0
  end
  
  it "should have one record" do
    Factory.create(:reference_dataset)
    ReferenceDataset.count.should == 1
  end
  
  it "fails validation on poorly formatted url (using errors_on)" do
    ReferenceDataset.new({
      :url => "google.com"
    }).should have(1).error_on(:url)
  end
  
  it "passes validation with properly formatted url HTTP (using errors_on)" do
    ReferenceDataset.new({
      :url => "http://google.com"
    }).should have(:no).error_on(:url)
  end
  
  it "passes validation with properly formatted url HTTPS (using errors_on)" do
    ReferenceDataset.new({
      :url => "https://google.com"
    }).should have(:no).error_on(:url)
  end
  
  it "passes validation with properly formatted url FTP (using errors_on)" do
    ReferenceDataset.new({
      :url => "ftp://google.com"
    }).should have(:no).error_on(:url)
  end
end