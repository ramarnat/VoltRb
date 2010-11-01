$:.unshift File.dirname(__FILE__) + "/../lib"
require 'rubygems'
require 'voltrb'

module VoltRbSpecHelpers
  def create_client
    VoltRb::Client.new(:username => "foo", :password => "bar")
  end

  def test_echo(client, table_name, rid, value)
    client.call_procedure("Insert#{table_name.to_s}", rid, value)
    client.call_procedure("Select#{table_name.to_s}", rid).results.first.first[:DUMMY] == value
  end
end

