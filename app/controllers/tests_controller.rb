class TestsController < ApplicationController
  def index
    @tests = Test.unscoped
  end

  def show
    @test = Test.find(params[:id])
  end
end
