module Students
  class SessionsController < ApplicationController
    include SetSchoolAndStudent
    
    before_action :set_school, only: %i[ new create ]
    before_action :set_student, only: %i[ create ]

    # GET /login
    def new
      render :new
    end

    # POST /login
    def create
      if @student&.authenticate(password_params)
        session[:student_id] = @student.id
        redirect_to school_student_path(@school, @student)
      else
        render :new
      end
    end

    # DELETE /logout
    def destroy
      session[:student_id] = nil
      redirect_to root_path
    end

    private

    def set_student
      @student = @school.students.find_by(email: email_params)
      raise ActiveRecord::RecordNotFound, "Student Record not found" unless @student
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email)
    end

    def password_params
      params.require(:password)
    end
  end
end
