require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe RFilemaker do
  before(:each) do
    xml = <<-eoxml
    <?xml version="1.0" encoding="UTF-8"?>
    <FMPXMLRESULT xmlns="http://www.filemaker.com/fmpxmlresult">
    	<ERRORCODE>0</ERRORCODE> 
    	<PRODUCT BUILD="5/23/2002" NAME="FileMaker Pro"
    	VERSION="7.0"/> 
    	<DATABASE DATEFORMAT="MM/dd/yy" LAYOUT="summary"
    	NAME="Employees.fp7" RECORDS="23" TIMEFORMAT="hh:mm:ss"/>
    	<METADATA>
    		<FIELD EMPTYOK="NO" MAXREPEAT="1" NAME="Name" TYPE="TEXT"/>
    		<FIELD EMPTYOK="NO" MAXREPEAT="1" NAME="Date joined" TYPE="DATE"/>
    	</METADATA>
    	<RESULTSET FOUND="2">
    		<ROW MODID="47" RECORDID="34"> 
    			<COL>
    				<DATA>Joe Smith</DATA>
    			</COL>
    			<COL>
    				<DATA>03/02/10</DATA>
    			</COL>
    		</ROW>
    		<ROW MODID="89" RECORDID="78">
    			<COL> 
    				<DATA>Susan Jones</DATA>
    			</COL>
    			<COL>
    				<DATA>04/05/09</DATA>
    			</COL>
    		</ROW>
    	</RESULTSET>
    </FMPXMLRESULT>
    eoxml
    
    @result = RFilemaker.parse(xml)
  end
  
  describe "records" do
    it "should parse the first record correctly" do
      r = @result[0]
      r.should == { 'Name' => 'Joe Smith', 'Date joined' => Date.new(2010,3,2) }
      r.mod_id.should    == 47
      r.record_id.should == 34
    end
    
    it "should parse the second record correctly" do
      r = @result[1]
      r.should == { 'Name' => 'Susan Jones', 'Date joined' => Date.new(2009,4,5) }
      r.mod_id.should    == 89
      r.record_id.should == 78
    end
  end
end
