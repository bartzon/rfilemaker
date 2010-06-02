require 'nokogiri'

module RFilemaker
  class SpecialHash < Hash
    def []=(key, value)
      super(key.downcase, value)
    end
    
    def [](key)
      super(key.to_s.downcase.gsub('_', ' '))
    end
  end
  
  def self.parse(string)
    doc = Nokogiri::XML.parse(string)
    ResultSet.new(doc)
  end
  
  autoload :ResultSet,  'rfilemaker/result_set'
  autoload :Field,      'rfilemaker/field'
  autoload :Row,        'rfilemaker/row'
  autoload :Record,     'rfilemaker/record'
end