class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  before_action :authenticate_user!

  helper_method :current_user, :logged_in?

  private

  def rescue_with_record_not_found
    render plain: 'Record Not Found!'
  end

  def authenticate_user!
    unless current_user
      cookies[:request_url] = request.url
      redirect_to login_path, alert: 'Are you a Guru? Vrify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
