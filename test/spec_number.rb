$:.unshift File.dirname(__FILE__)
require 'helpers'

describe "A Volt TinyInt" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Tinyint, 1, 1).should be_true
  end

  it "should handle the minimum value that's allowed." do
    test_echo(@client, :Tinyint, 2, -128).should be_true
  end

  it "should handle the maximum value that's allowed." do
    test_echo(@client, :Tinyint, 3, 127).should be_true
  end

  it "should reject out-of-range values." do
    lambda { test_echo(@client, :Tinyint, 11, 128) }.should raise_error(VoltRb::VoltError)
  end

  it "should handle NULLs." do
    test_echo(@client, :Tinyint, 21, nil).should be_true
  end
end

describe "A Volt SmallInt" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Smallint, 1, 1).should be_true
  end

  it "should handle the minimum value that's allowed." do
    test_echo(@client, :Smallint, 2, -32768).should be_true
  end

  it "should handle the maximum value that's allowed." do
    test_echo(@client, :Smallint, 3, 32767).should be_true
  end

  it "should reject out-of-range values." do
    lambda { test_echo(@client, :Smallint, 11, 32768) }.should raise_error(VoltRb::VoltError)
  end

  it "should handle NULLs." do
    test_echo(@client, :Smallint, 21, nil).should be_true
  end
end

describe "A Volt Integer" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Integer, 1, 1).should be_true
  end

  it "should handle the minimum value that's allowed." do
    test_echo(@client, :Integer, 2, -2147483648).should be_true
  end

  it "should handle the maximum value that's allowed." do
    test_echo(@client, :Integer, 3, 2147483647).should be_true
  end

  it "should reject out-of-range values." do
    lambda { test_echo(@client, :Integer, 11, 2147483648) }.should raise_error(VoltRb::VoltError)
  end

  it "should handle NULLs." do
    test_echo(@client, :Integer, 21, nil).should be_true
  end
end

describe "A Volt BigInt" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Bigint, 1, 1).should be_true
  end

  it "should handle the minimum value that's allowed." do
    test_echo(@client, :Bigint, 2, -9223372036854775808).should be_true
  end

  it "should handle the maximum value that's allowed." do
    test_echo(@client, :Bigint, 2, 9223372036854775807).should be_true
  end

  it "should reject out-of-range values." do
    lambda { test_echo(@client, :Bigint, 11, 9223372036854775808) }.should raise_error(VoltRb::VoltError)
  end

  it "should handle NULLs." do
    test_echo(@client, :Bigint, 21, nil).should be_true
  end
end

describe "A Volt Float" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Float, 1, 99.123).should be_true
  end

  it "should handle NULLs." do
    test_echo(@client, :Float, 21, nil).should be_true
  end
end

describe "A Volt Decimal" do
  include VoltRbSpecHelpers

  before do
    @client = create_client    
  end

  it "should handle a normal value." do
    test_echo(@client, :Decimal, 1, BigDecimal.new("1234567890.12345689")).should be_true
  end

  it "should handle NULLs." do
    test_echo(@client, :Decimal, 21, nil).should be_true
  end
end

