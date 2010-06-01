module RFilemaker
  class Row
    attr_reader :record_id, :mod_id, :columns
    
    def initialize(xml)
      @record_id = xml['RECORDID'].to_i
      @mod_id    = xml['MODID'].to_i
      @columns   = xml.css('COL DATA').collect { |x| x.inner_text }
    end
  end
end