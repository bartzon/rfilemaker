require File.dirname(__FILE__) + '/../spec_helper'

describe RFilemaker::ResultSet do
  describe "parsing" do
    def parse(str)
      RFilemaker::ResultSet.parse_date_format(str)
    end
    
    describe "date formats" do
      it "should parse 'mm/dd/yy' correctly" do
        parse('mm/dd/yy').should == '%m/%d/%y'
      end

      it "should parse 'mm/dd/yyyy' correctly" do
        parse('mm/dd/yyyy').should == '%m/%d/%y'
      end

      it "should parse 'MM/dd/yy' correctly" do
        parse('MM/dd/yy').should == '%m/%d/%y'
      end

      it "should parse 'M/dd/yy' correctly" do
        parse('M/dd/yy').should == '%m/%d/%y'
      end

      it "should parse 'mm/dd/yy' correctly" do
        parse('mm/d/yy').should == '%m/%d/%y'
      end
    end
    
    describe "time formats" do
      it "should parse 'hh:mm:ss' correctly" do
        parse('hh:mm:ss').should == '%I:%m:%S'
      end

      it "should parse 'h:mm:ss' correctly" do
        parse('h:mm:ss').should == '%I:%m:%S'
      end

      it "should parse 'hh:mm:ss a' correctly" do
        parse('hh:mm:ss a').should == '%I:%m:%S %p'
      end

      it "should parse 'kk:mm:ss' correctly" do
        parse('kk:mm:ss').should == '%H:%m:%S'
      end

      it "should parse 'k:mm:ss' correctly" do
        parse('k:mm:ss').should == '%H:%m:%S'
      end
    end
  end
end
