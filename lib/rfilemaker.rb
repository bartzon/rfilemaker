require 'nokogiri'

module RFilemaker
  def self.parse(xml)
    doc = Nokogiri::XML(xml)
    RFilemaker::ResultSet.new(doc)
  end
  
  autoload :ResultSet,  'rfilemaker/result_set'
  autoload :Field,      'rfilemaker/field'
  autoload :Row,        'rfilemaker/row'
  autoload :Record,     'rfilemaker/record'
end