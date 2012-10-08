require 'bigdecimal'

module VoltRb
  # Set of utility functions.
  module Utils
    # Converts a string to a Big Decimal.
    def dec_from_str(str)
      BigDecimal.new(str)
    end

    # Converts an integer (millisecond value since epoch) to a Time object.
    def time_from_milli_epoch(num)
      Time.at(num/1000.0)
    end

    # Converts a val of type into its Ruby equivalent.
    def ruby_from_volt(val, type)
      return nil if val.nil?

      case type
        when Types::DECIMAL then dec_from_str(val)
        when Types::TIMESTAMP then time_from_milli_epoch(val)
        else val
      end
    end

    module_function :dec_from_str, :time_from_milli_epoch, :ruby_from_volt
  end
end

