module RFilemaker
  class Row < Hash
    def initialize(xml)
      self[:record_id] = xml['RECORDID'].to_i
      self[:mod_id]    = xml['MODID'].to_i

      self[:columns] = xml.css('COL').collect do |col|
        datas = col.css('DATA')
        if datas.size > 1
          datas.collect { |x| x.inner_text }
        else
          datas.inner_text
        end
      end
    end
  end
end