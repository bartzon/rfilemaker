require 'nokogiri'

module RFilemaker
  def self.parse(string)
    doc = Nokogiri::XML.parse(string)
    ResultSet.new(doc)
  end
  
  autoload :ResultSet,  'rfilemaker/result_set'
  autoload :Field,      'rfilemaker/field'
  autoload :Row,        'rfilemaker/row'
  autoload :Record,     'rfilemaker/record'
end