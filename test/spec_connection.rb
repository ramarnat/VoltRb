$:.unshift File.dirname(__FILE__)
require 'helpers'

describe "A Volt Client" do
  it "should fail if no authorization credentials are provided." do
    lambda do 
      client = VoltRb::Client.new
      client.call_procedure("SelectInteger", 9999)
    end.should raise_error(VoltRb::VoltError)
  end

  it "should reject a non-existent user" do
    lambda do
      client = VoltRb::Client.new(:username => "nobody", :password => "cares")
      client.call_procedure("SelectInteger", 9999)
    end.should raise_error(VoltRb::VoltError)
  end

  it "should reject if password is not correct." do
    lambda do
      client = VoltRb::Client.new(:username => "foo", :password => "wrong")
      client.call_procedure("SelectInteger", 9999)
    end.should raise_error(VoltRb::VoltError)
  end

  it "should connect if correct credentials are provided." do
    lambda do
      client = VoltRb::Client.new(:username => "foo", :password => "bar")
      client.call_procedure("SelectInteger", 9999)
    end.should_not raise_error(VoltRb::VoltError)
  end
end

