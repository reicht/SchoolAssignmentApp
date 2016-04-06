class StudentsController < ApplicationController
  def index
    @students = Student.where(school: params[:school_id]).page params[:page]
  end

  def show
  end

  def new
    @student = Student.new
    @school = School.where(id: params[:school_id])
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to :back
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def get_student
    Student.find(params.fetch(:id))
  end

  def student_params
    params.require(:student).permit(:name, :school_id, :teacher_id)
  end
end
