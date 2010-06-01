module RFilemaker
  class ResultSet < Array
    attr_reader :fields, :rows
    attr_reader :date_format, :time_format
    
    def initialize(doc)
      @fields = extract_fields(doc)
      @rows   = extract_rows(doc)

      d = doc.css('DATABASE')
      @date_format = parse_date_format(d.attribute('DATEFORMAT').to_s)
      @time_format = parse_date_format(d.attribute('TIMEFORMAT').to_s)
            
      @rows.each do |row|
        self << Record.new(row, fields)
      end
    end
    
    private
      def extract_fields(doc)
        doc.css('METADATA FIELD').collect do |xml|
          Field.new(xml, self)
        end
      end
      
      def extract_rows(doc)
        doc.css('RESULTSET ROW').collect do |xml|
          Row.new(xml)
        end
      end
      
      def parse_date_format(string)
        string.downcase.gsub(/yy/, '%y').gsub(/mm/, '%m').gsub(/dd/, '%d')
      end
  end
end