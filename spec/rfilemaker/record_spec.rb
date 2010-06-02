require File.dirname(__FILE__) + '/../spec_helper'

describe RFilemaker::Record do
  before(:each) do
    @row = mock("Row", :record_id => 1, :mod_id => 2)
  end
  
  it "should be frozen" do
    r = RFilemaker::Record.new(@row, [])
    r.should be_frozen
  end
end
