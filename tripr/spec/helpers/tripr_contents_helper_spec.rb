require 'spec_helper'

describe TriprContentsHelper do
  describe "#protocol" do
    it "returns current protocol" do
      @request.env['HTTPS'] = 'on'
      helper.protocol.should eq('https://')

      @request.env['HTTPS'] = 'off'
      helper.protocol.should eq('http://')
    end
  end

  describe "#format_species_name" do
    it "returns HTML safe name wrapped in <em>" do
      helper.format_species_name("foo bar (baz)").should eq(
       "<em>foo bar </em>(baz)"
      )
    end
  end
end
