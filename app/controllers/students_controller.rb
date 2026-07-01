class StudentsController < ApplicationController
  before_action :login_required
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.order(created_at: :desc)
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @student.user = current_user

    if @student.save
      redirect_to @student, notice: "Student was successfully created."
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: "Student was successfully deleted."
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :email, :phone_number)
  end
end