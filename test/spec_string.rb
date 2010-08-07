# coding: utf-8
# Above line/comment is Needed for Ruby 1.9 above.

$:.unshift File.dirname(__FILE__)
require 'helpers'

describe "A Volt String" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should accept a regular string." do
    test_echo(@client, :String, 1, "Hello, World!").should be_true
  end

  it "should reject string longer than column's max length." do
    s = ""
    1001.times { |i| s << (i%10).to_s }
    lambda { test_echo(@client, :String, 2, s) }.should raise_error(VoltRb::VoltError)
  end

  it "should accept a UTF string." do
    test_echo(@client, :String, 3, "こんにちは世界").should be_true
  end

  it "should handle NULLs." do
    test_echo(@client, :String, 21, nil).should be_true
  end
end

