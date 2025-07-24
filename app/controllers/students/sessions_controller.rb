module Students
  class SessionsController < ApplicationController
    before_action :set_school, only: %i[ new create ]
    before_action :set_student, only: %i[ create ]

    # GET /login
    def new
      render :new
    end

    # POST /login
    def create
      if @student&.authenticate(params[:password])
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

    def set_school
      @school = School.find(school_id_params)
      raise ActiveRecord::RecordNotFound, "School not found" unless @school
    end

    def school_id_params
      params.require(:school_id)
    end

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
