class TermsController < ApplicationController
  include SetSchoolAndStudent

  before_action :set_school
  before_action :set_student
  before_action :set_term, only: %i[ show ]
  before_action :authenticate_student!

  # GET /terms/1 or /terms/1.json
  def show
    authorize @term
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_term
      @term = @school.terms.find(params[:id])
    end

end
