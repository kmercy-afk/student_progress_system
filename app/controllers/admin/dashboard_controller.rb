class Admin::DashboardController < ApplicationController
  before_action :login_required
  before_action :admin_required

  def index
    @users_count = User.count
    @students_count = Student.count
    @courses_count = Course.count
    @assignments_count = Assignment.count
    @progresses_count = Progress.count
  end
end