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
    @school = School.find(params.fetch(:school_id))
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @school = School.find(params.fetch(:school_id))

    if @teacher.save
      redirect_to school_teacher_path(@school, @teacher)
    else
      render :new
    end
  end

  def edit
    @teacher = get_teacher
    @school = School.find(params.fetch(:school_id))

  end

  def update
    @teacher = get_teacher
    @school = School.find(params.fetch(:school_id))

    if @teacher.update(teacher_params)
      redirect_to school_teacher_path(@school, @teacher)
    else
      render :edit
    end
  end

  def destroy
    @teacher = get_teacher
    school = @teacher.school

    if @teacher.destroy
      redirect_to school_path_url(school)
    else
      redirect_to :back
    end
  end


  private
  def get_teacher
    Teacher.find(params.fetch(:id))
  end

  def teacher_params
    params.require(:teacher).permit(:name, :school_id)
  end
end
