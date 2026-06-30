class AssignmentsController < ApplicationController
  before_action :login_required
  before_action :set_assignment, only: %i[show edit update destroy]

  def index
    @assignments = Assignment.joins(:course)
                             .where(courses: { user_id: current_user.id })
                             .order(created_at: :desc)
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if current_user.courses.include?(@assignment.course) && @assignment.save
      redirect_to @assignment, notice: "Assignment was successfully created."
    else
      flash.now[:alert] = "Please select one of your own courses."
      render :new
    end
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: "Assignment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path, notice: "Assignment was successfully deleted."
  end

  private

  def set_assignment
    @assignment = Assignment.joins(:course)
                            .where(courses: { user_id: current_user.id })
                            .find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(
      :title,
      :description,
      :due_date,
      :course_id
    )
  end
end