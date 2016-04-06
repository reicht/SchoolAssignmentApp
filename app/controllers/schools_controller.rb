class SchoolsController < ApplicationController
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
      redirect_to root_path
    else
      render :new
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
