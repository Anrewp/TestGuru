class TestsController < ApplicationController
  def index
    @tests = Test.unscoped
  end
end
