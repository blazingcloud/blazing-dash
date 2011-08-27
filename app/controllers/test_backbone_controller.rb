class TestBackboneController < ApplicationController
  def index
  end

  def weekly_data
    render json: [
      {message: "foo", date: '23/11/2001'}
    ]
  end
end