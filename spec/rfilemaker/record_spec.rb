require File.dirname(__FILE__) + '/../spec_helper'

describe RFilemaker::Record do
  it "should be frozen" do
    row = mock("Row", :record_id => 1, :mod_id => 2)
    r = RFilemaker::Record.new(row, [])
    r.should be_frozen
  end
end
