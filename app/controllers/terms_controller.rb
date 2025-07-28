class TermsController < ApplicationController
  include SetSchoolAndStudent

  before_action :set_school
  before_action :set_student
  before_action :set_term, only: %i[ show ]
  before_action :authenticate_student!

  # GET /terms/1 or /terms/1.json
  def show
    authorize @term

    load_accessible_courses
    load_available_courses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_term
    @term = @school.terms.find(params[:id])
  end

  def load_accessible_courses
    @accessible_courses  = @student.courses.where(term: @term)
  end

  def load_available_courses
    @available_courses = @term.courses.where.not(id: @accessible_courses.pluck(:id))
  end
end
