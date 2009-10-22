require File.dirname(__FILE__) + '/../spec_helper'

describe "MPIResponse" do
  it "should contain data" do
    response_data = {:a => 1, :b => 2}
    MPIResponse.new(response_data).data.should == response_data
  end

  describe "automatic accessors" do
    it "should return 'data' hash value" do
      response = MPIResponse.new({:status => 'Y'})
      response.status.should == response.data[:status]
    end

    it "should return nil if there is no value in 'data' hash" do
      response = MPIResponse.new()
      response.status.should be_nil
    end
  end

  describe "success?" do
    it "should be true if error code and error message is nil" do
      MPIResponse.new.should be_success
    end

    it "should be false if error code or error message not nil" do
      response = MPIResponse.new(:error_code => "C3", :error_message => 'Somthing went wrong.')
      response.should_not be_success
    end
  end
end
