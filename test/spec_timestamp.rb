$:.unshift File.dirname(__FILE__)
require 'helpers'

describe "A Volt Timestamp" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should accept a Ruby Time object." do
    timestamp = Time.now
    @client.call_procedure("InsertTimestamp", 1, timestamp)
    @client.call_procedure("SelectTimestamp", 1) == timestamp
  end

  it "should accept a Ruby Date object." do
    timestamp = Date.today
    @client.call_procedure("InsertTimestamp", 2, timestamp)
    @client.call_procedure("SelectTimestamp", 2) == Time.parse(timestamp.to_s)
  end

  it "should accept a Ruby DateTime object." do
    timestamp = DateTime.now
    @client.call_procedure("InsertTimestamp", 3, timestamp)
    @client.call_procedure("SelectTimestamp", 3) == Time.parse(timestamp.to_s)
  end

  it "should handle NULLs." do
    test_echo(@client, :Timestamp, 21, nil).should be_true
  end
end

