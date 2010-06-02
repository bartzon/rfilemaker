require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RFilemaker do
  before(:each) do
    @xml = "<foo></foo>"
    RFilemaker::ResultSet.stub!(:new).and_return 'result set'
    Nokogiri::XML.stub!(:parse).and_return 'xml'
  end
  
  def parse
    RFilemaker.parse(@xml)
  end
  
  it "should parse a string using nokogiri" do
    Nokogiri::XML.should_receive(:parse).with(@xml)
    parse
  end
  
  it "should initialize a resultset with the parsed xml" do
    RFilemaker::ResultSet.should_receive(:new).with('xml')
    parse
  end
  
  it "should return the resultset" do
    parse.should == 'result set'
  end
  
  describe "'special' hash" do
    before(:each) do
      @h = RFilemaker::SpecialHash.new
      @h['Foo BAR'] = 'baz'
    end
    
    it "should lookup keys as string" do
      @h['Foo BAR'].should == 'baz'
    end
    
    it "should lookup keys as lowercase strings" do
      @h['foo bar'].should == 'baz'
    end
  end
end
