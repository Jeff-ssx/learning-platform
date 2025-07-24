class StudentsController < ApplicationController
  before_action :set_school
  before_action :set_student
  before_action :authenticate_student!

  def show
    authorize @student
  end

  private

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_student
    @student = @school.students.find(params[:id])
  end
end
