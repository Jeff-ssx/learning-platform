class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def current_student
    @current_student ||= Student.find_by(id: session[:student_id]) if session[:student_id]
  end

  def current_user
    current_student
  end

  def authenticate_student!
    redirect_to school_students_login_path(@school) unless current_student
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end

  def render_not_found
    render file: Rails.root.join("public/404.html"), status: :not_found, layout: false
  end
end
