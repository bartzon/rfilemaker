module RFilemaker
  class Field
    attr_reader :name, :type
    
    def initialize(xml, result_set)
      @name = xml['NAME']
      @type = xml['TYPE'] ? xml['TYPE'].downcase.to_sym : :none
      @result_set = result_set
    end
    
    def coerce(value)
      case type
        when :date
          Date.strptime(value, @result_set.date_format)
        when :time
          DateTime.strptime(value, @result_set.time_format)
        when :timestamp
          DateTime.strptime(value, @result_set.time_format)
        when :number
          value.include?('.') ? value.to_f : value.to_i
        else
          value.to_s
      end
    end
  end
end