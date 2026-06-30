class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def login_required
    redirect_to login_path, alert: "Please log in first." unless logged_in?
  end

  def admin_required
    redirect_to root_path, alert: "You are not authorized to access this page." unless admin?
  end
end