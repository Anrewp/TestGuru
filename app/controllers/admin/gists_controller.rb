class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.unscoped.includes(:question, :user)
  end
end
