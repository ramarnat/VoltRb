module VoltRb
  # An object of this class is returned by a call to Client#call_procedure.
  #   response = client.call_procedure("Select", "Spanish")
  # Some VoltDB stored procedures return multiple rowsets. (Think of one rowset as the rows returned by a SQL select.)
  # You get access to these array of rowsets (VoltTable objects) thru results.
  class ProcedureResponse
    # This is a plain Ruby hash derived from the JSON response from VoltDB.
    # We can use this hash to access the entire response entity as an alternative to the object methods below.
    # May save us a few CPU cycles. (Benchmark to be sure.)
    # No conversions are done for values of type Decimal and Timestamp so we'll have to handle those ourselves.
    # We can also use the conversion functions in Utils
    attr_reader :raw

    def initialize(response)
      @raw = JSON.parse(response)      
    end

    def status
      @status ||= @raw["status"]
    end

    def status_string
      @status_string ||= @raw["statusstring"]
    end

    def app_status
      @app_status ||= @raw["appstatus"]
    end

    def app_status_string
      @app_status_string ||= @raw["appstatusstring"]
    end

    # Returns an array of VoltTable.
    def results
      @results ||= hydrate_results
    end

  private
    def hydrate_results
      @raw["results"].inject([]) { |o,e| o << VoltTable.new(e); o }
    end
  end
end

