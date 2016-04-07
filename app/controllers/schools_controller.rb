class SchoolsController < ApplicationController
skip_before_action :authenticate_user, only: [:index]

  def index
    @schools = School.page params[:page]
  end

  def show
    @school = get_school
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school
    else
      render :new
    end
  end

  def edit
    @school = get_school
  end

  def update
    @school = get_school

    if @school.update(school_params)
      redirect_to @school
    else
      render :edit
    end
  end

  def destroy
    @school = get_school

    if @school.destroy
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private
  def get_school
    School.find(params.fetch(:id))
  end

  def school_params
    params.require(:school).permit(:name)
  end
end
