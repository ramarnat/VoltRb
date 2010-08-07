require 'json'
require 'rest_client'
require 'date'
require 'time'
require 'bigdecimal'

module VoltRb
  # This is the main class we use to interact with the VoltDB instance.
  #
  # == Initialization
  # Create a client and connect to the instance in localhost:
  #   client = VoltRb::Client.new
  #
  # Or pass it a hash of options like:
  #   client = VoltRb::Client.new({:host => "voltdb_server", :port => 8888})
  #
  # See the new method for more details.
  #
  # == Calling stored procedures
  # Call a stored procedure:
  #   client.call_procedure(:MyStoredProc, "This is the first argument", 2, Date.today)
  #
  # The call above invokes the VoltDB stored procedure named "MyStoredProc". 
  # The procedure expects 3 parameters (a String, a small integer, and a Date/Timestamp) so we pass these in order.
  # See call_procedure method for more.
  #
  # == Getting the stored procedure response
  # call_procedure returns a ProcedureResponse object which will contain the rows returned if any:
  #   response = client.call_procedure(:AnotherProc, 1)
  #   puts response.results[0].first[:TITLE]
  #
  # In the above example, we invoke the procedure "AnotherProc" and expect one rowset and 
  # one row with a column named "TITLE".
  # See ProcedureResponse for more.
  #
  # == Handling errors
  # In case of typical errors like network connection problems, standard Ruby exceptions will be raised. 
  # In case of VoltDB-specific errors like invalid stored procedure arguments or constraint violations, 
  # a VoltDB::VoltError exception object will be raised.
  #   begin
  #     client.call_procedure(:MyStoredProc, 2)
  #   rescue VoltDB::VoltError => bang
  #     puts bang.status_string
  #     raise
  #   end
  #
  # The above call will raise an error because it expects 3 parameters but was only given one. 
  # We can find the details of the error by inspecting status_string or app_status_string.
  # See VoltError for more.
  class Client
    attr_reader :host, :port
    attr_accessor :api_root

    # Calling new without any arguments will create a client and have it connect to the VoltDB instance running 
    # in localhost:8080.
    # Pass an options hash to modify these defaults. 
    #   client = VoltRb::Client.new({:host => "voltdb_server", :port => 8888})
    #
    # Right now, only two options are recognized:
    # * host - the machine name or IP address
    # * port - other than the default
    #
    # <em>Note on user authentication:</em>
    # As of v1.1, the VoltDB JSON interface does not implement any form of authentication. 
    # See the README[link:files/README.html] for more.
    def initialize(options = {})
      @host = options[:host] || "localhost"
      @port = options[:port] || 8080
      @api_root = "http://#{@host}:#{@port}/api/1.0/"
    end

    # Invoke a VoltDB stored procedure by calling this method with the first argument being the stored procedure name. 
    # Follow that with any number of parameters needed by the stored procedure itself.
    #   client.call_procedure(:MyStoredProc, "This is the first argument for :MyStoredProc", 2, Date.today)
    #
    # Ruby types map to the stored procedure data types as below:
    # Ruby::    VoltDB 
    # Fixnum, Bignum::  Tiny, Small, Integer, Long
    # Float::   Float, Double
    # BigDecimal:: Decimal
    # Time, Date, DateTime::  Timestamp
    # String::  String
    # 
    # Nils become Nulls. 
    # If a stored procedure returns one or more rowsets that we're interested in, see the ProcedureResponse object
    # that's returned by this method.
    # In case of errors, handle the usual Ruby errors and the VoltDB-specfic VoltError (this inherits from StandardError).
    def call_procedure(procedure_name, *args)
      params = args.inject([]) { |o,e| o << prep_param(e); o }
      response = RestClient.post(@api_root, :Procedure => procedure_name.to_s, :Parameters => params.to_json, :content_type => "text/plain; charset=UTF-8", :accept => :json)
      proc_resp = ProcedureResponse.new(response)
      raise(VoltError.new(proc_resp.status, proc_resp.status_string, proc_resp.app_status, proc_resp.app_status_string), "A VoltDB procedure error occurred. See the exception object for details.") if proc_resp.raw["status"] != 1 or proc_resp.raw["appstatus"] != -128
      proc_resp
    end

  private
    def prep_param(val)
      case val
        when BigDecimal then val.to_s('F')
        when Time then val.to_i * 1000
        # Note: case DateTime MUST come before Date because Ruby seems to think DateTime is a Date. But Date is not a DateTime. Ruby bug?
        when DateTime then Time.parse(val.strftime("%a %b %d %H:%M:%S %z %Y")).to_i * 1000
        when Date then Time.parse(val.strftime("%b %d %Y")).to_i * 1000
        else val
      end
    end
  end
end

