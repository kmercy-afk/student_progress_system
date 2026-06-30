class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email]&.downcase)

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "Logged out successfully."
  end

  def guest_login
    user = User.find_or_create_by!(email: "guest@example.com") do |guest|
      guest.name = "Guest User"
      guest.password = "password"
      guest.password_confirmation = "password"
      guest.admin = false
    end

    session[:user_id] = user.id
    redirect_to dashboard_path, notice: "Logged in as Guest User."
  end

  def admin_guest_login
    user = User.find_or_create_by!(email: "admin_guest@example.com") do |admin|
      admin.name = "Admin Guest User"
      admin.password = "password"
      admin.password_confirmation = "password"
      admin.admin = true
    end

    session[:user_id] = user.id
    redirect_to dashboard_path, notice: "Logged in as Admin Guest User."
  end
end