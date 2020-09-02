class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  private

  def rescue_with_record_not_found
    render plain: 'Record Not Found!'
  end
end
