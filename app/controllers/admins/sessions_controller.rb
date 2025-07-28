module Admins
  class SessionsController < ApplicationController
    include SetSchoolAndStudent
    
    before_action :set_school, only: %i[ new create ]
    before_action :set_admin, only: %i[ create ]

    # GET /login
    def new
      render :new
    end

    # POST /login
    def create
      if @admin&.authenticate(password_params)
        session[:admin_id] = @admin.id
        redirect_to school_admins_dashboard_path(@school)
      else
        render :new
      end
    end

    # DELETE /logout
    def destroy
      session[:admin_id] = nil
      redirect_to root_path
    end

    private

    def set_admin
      @admin = @school.admins.find_by(email: email_params)
      raise ActiveRecord::RecordNotFound, "Admin Record not found" unless @admin
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
