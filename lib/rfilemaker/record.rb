module RFilemaker
  class Record < Hash
    attr_reader :record_id, :mod_id
    
    def initialize(row, fields)
      @row = row
      @record_id = @row.record_id
      @mod_id    = @row.mod_id
      
      fields.each_with_index do |field, index|
        self[field.name] = field.coerce(row.columns[index])
      end
    end
  end
end