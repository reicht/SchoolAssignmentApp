class TeachersController < ApplicationController
  def index
    @teachers = Teacher.where(school: params[:school_id]).page params[:page]
  end

  def show
    @teacher = get_teacher
    @students = @teacher.student.page params[:page]
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
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
  def get_teacher
    Teacher.find(params.fetch(:id))
  end

  def student_params
    params.require(:teacher).permit(:name, :school_id)
  end
end
