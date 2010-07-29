module VoltRb
  # Raised in case of VoltDB-specific errors such as stored procedure invalid arguments or constraint violations.
  # Inspect status, status_string, app_status, and app_status_string for details on the error returned by VoltDB.
  class VoltError < StandardError
    attr_reader :status, :status_string, :app_status, :app_status_string

    def initialize(status, status_string, app_status, app_status_string)
      @status, @status_string, @app_status, @app_status_string = status, status_string, app_status, app_status_string
    end
  end
end
