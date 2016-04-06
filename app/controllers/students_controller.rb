class StudentsController < ApplicationController
  def index
    @students = Student.where(school: params[:school_id]).page params[:page]
  end

  def show
    @student = get_student
  end

  def new
    @student = Student.new
    @school = School.find(params.fetch(:school_id))
  end

  def create
    @student = Student.new(student_params)
    @school = School.find(params.fetch(:school_id))

    if @student.save
      redirect_to school_student_path(@school, @student)
    else
      render :new
    end
  end

  def edit
    @student = get_student
    @school = School.find(params.fetch(:school_id))

  end

  def update
    @student = get_student
    @school = School.find(params.fetch(:school_id))

    if @student.update(student_params)
      redirect_to school_student_path(@school, @student)
    else
      render :edit
    end
  end

  def destroy
    @student = get_student
    school = @student.school

    if @student.destroy
      redirect_to school_path(school)
    else
      redirect_to :back
    end
  end

  private
  def get_student
    Student.find(params.fetch(:id))
  end

  def student_params
    params.require(:student).permit(:name, :school_id, :teacher_id)
  end
end
