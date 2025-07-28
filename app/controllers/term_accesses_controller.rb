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
    payment_method = params[:term_access][:payment_method]

    context = case payment_method
              when 'license'
                { license_code: params[:term_access][:license_code] }
              when 'credit_card'
                { credit_card_num: params[:term_access][:credit_card_num] }
              else
                {}
              end

    builder = TermAccessBuilder.new(
      student: @student,
      term: @term,
      payment_method: payment_method,
      context: context
    )

    if builder.call
      redirect_to school_student_path(@school, @student)
    else
      # Re-use @term_access with errors from builder to re-render form
     @term_access = builder.term_access || TermAccess.new
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_term
      @term = @school.terms.find(term_id)
    end

    def term_id
        params.require(:term_id)
    end

    def term_access_params
      params.require(:term_access).permit(:payment_method, :license_code, :credit_card_num)
    end
end
