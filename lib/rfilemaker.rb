require 'nokogiri'

module RFilemaker
  class SpecialHash < Hash # :nodoc: all
    def []=(key, value)
      super(key.downcase, value)
    end
    
    def [](key)
      super(key.to_s.downcase)
    end
  end
  
  # Parse a FMPXMLRESULT string into an Array
  #
  # Each element in the Array is a Hash, representing a row in the imported XML
  def self.parse(string)
    doc = Nokogiri::XML.parse(string)
    ResultSet.new(doc)
  end
  
  autoload :ResultSet,  'rfilemaker/result_set'
  autoload :Field,      'rfilemaker/field'
  autoload :Row,        'rfilemaker/row'
  autoload :Record,     'rfilemaker/record'
end