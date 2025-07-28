class CoursesController < ApplicationController
  include SetSchoolAndStudent

  before_action :set_school
  before_action :set_student
  before_action :authenticate_student!
  before_action :set_course, only: %i[ show ]

  # GET /courses/1 or /courses/1.json
  def show
    authorize @course
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

end
