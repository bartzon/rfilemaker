require File.dirname(__FILE__) + '/../spec_helper'

describe RFilemaker::Field do
  describe "coercing values" do
    before(:each) do
      x  = Nokogiri::XML.parse('<foo/>')
      rs = mock("Rfilemaker::ResultSet", :date_format => 'date_format', :time_format => 'time_format')
      @f = RFilemaker::Field.new(x, rs)
    end
    
    it "should coerce a string correctly" do
      @f.stub!(:type).and_return :string
      @f.coerce('foo').should == 'foo'
    end
    
    it "should coerce a float correctly" do
      @f.stub!(:type).and_return :number
      @f.coerce('10.45').should == 10.45
    end

    it "should coerce an int correctly" do
      @f.stub!(:type).and_return :number
      @f.coerce('10').should == 10
    end
    
    it "should coerce a date correctly" do
      Date.should_receive(:strptime).with('foo', 'date_format').and_return 'd'
      @f.stub!(:type).and_return :date
      @f.coerce('foo').should == 'd'
    end
    
    it "should coerce a time correctly" do
      DateTime.should_receive(:strptime).with('foo', 'time_format').and_return 't'
      @f.stub!(:type).and_return :time
      @f.coerce('foo').should == 't'
    end

    it "should coerce a timestamp correctly" do
      DateTime.should_receive(:strptime).with('foo', 'time_format').and_return 't'
      @f.stub!(:type).and_return :timestamp
      @f.coerce('foo').should == 't'
    end
  end
end
