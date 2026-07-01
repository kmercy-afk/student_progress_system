class AssignmentsController < ApplicationController
  before_action :login_required
  before_action :set_assignment, only: %i[show edit update destroy]

  def index
  @assignments = Assignment.includes(:course).order(created_at: :desc)
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

  if @assignment.save
    redirect_to @assignment, notice: "Assignment was successfully created."
  else
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
  @assignment = Assignment.find(params[:id])
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