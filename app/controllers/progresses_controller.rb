class ProgressesController < ApplicationController
  before_action :login_required
  before_action :set_progress, only: %i[show edit update destroy]

  def index
  @progresses = Progress.includes(:student, :course).order(created_at: :desc)
  end

  def show
  end

  def new
    @progress = Progress.new
  end

  def edit
  end

  def create
  @progress = Progress.new(progress_params)

  if @progress.save
    redirect_to @progress, notice: "Progress was successfully created."
  else
    render :new
  end
end

  def update
  if @progress.update(progress_params)
    redirect_to @progress, notice: "Progress was successfully updated."
  else
    render :edit
  end
end

  def destroy
    @progress.destroy
    redirect_to progresses_path, notice: "Progress was successfully deleted."
  end

  private

  def set_progress
  @progress = Progress.find(params[:id])
  end

  def progress_params
    params.require(:progress).permit(
      :student_id,
      :course_id,
      :completion_percentage,
      :status
    )
  end

  def own_student_and_course?(progress)
    current_user.students.exists?(progress.student_id) &&
      current_user.courses.exists?(progress.course_id)
  end
end