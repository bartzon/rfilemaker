module RFilemaker
  class Field
    attr_reader :name, :type
    
    def initialize(xml, result_set)
      @name       = xml['NAME']
      @type       = xml['TYPE'] ? xml['TYPE'].downcase.to_sym : :none
      @empty_ok   = xml['EMPTYOK'] == 'YES'
      @result_set = result_set
    end
    
    def coerce(value)
      return nil if value.nil? || value == ''
      
      case type
        when :date
          Date.strptime(value, @result_set.date_format) unless @empty_ok
        when :time
          DateTime.strptime("1/1/-4712 #{value}", @result_set.time_format) unless @empty_ok
        when :timestamp
          DateTime.strptime(value, @result_set.time_format) unless @empty_ok
        when :number
          if value.include?('.')
            value.to_f
          elsif value.include?(',')
            value.gsub(/,/, '.').to_f
          else
            value.to_i
          end
        else
          value.to_s
      end
    end
  end
end
