class TermAccessesController < ApplicationController
  include SetSchoolAndStudent
  before_action :set_school
  before_action :set_student
  before_action :set_term
  before_action :authenticate_student!

  # GET /term_accesses/new
  def new
    @term_access = TermAccess.new
  end

  # POST /term_accesses
  def create

    builder = TermAccessBuilder.new(
        student: @student,
        term: @term,
        payment_method: :credit_card # FIXME: apply actual payment method later.
    )

    if builder.call
        # success
        redirect_to school_student_path(@school, @student)
    else
        # fail
        @term_access = TermAccess.new
        render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def term_params
      params.fetch(:term, {})
    end

    def set_term
      @term = @school.terms.find(term_id)
    end

    def term_id
        params.require(:term_id)
    end
end
