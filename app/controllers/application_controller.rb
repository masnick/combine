class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl if Rails.env.production?

  def require_admin
    redirect_to root_url unless current_admin_user
  end
end
