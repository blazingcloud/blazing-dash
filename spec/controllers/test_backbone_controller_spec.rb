require 'spec_helper'

describe TestBackboneController do
  describe "#index" do
    it "should be successful" do
      get :index

      response.should be_success
    end
  end

  describe "#weekly_data" do
    it "should be successful" do
      get :weekly_data

      response.should be_success
    end

    it "should render a hash as json" do
      get :weekly_data

      JSON.parse(response.body).should be_a(Array)
    end

    it "should return json objects with a message and date attribute" do
      get :weekly_data

      JSON.parse(response.body).each do |message|
        message.should have_key("message")
        message.should have_key("date")
      end
    end

    describe "messages" do
      before do
        get :weekly_data

        @message = JSON.parse(response.body)[0]
      end

      describe "date" do
        before do
          @date = @message['date']
        end

        it "should be a valid date" do
          expect {
            puts @date
            puts @date.class
            Date.parse(@date)
          }.to_not raise_error
        end
      end
    end
  end
end