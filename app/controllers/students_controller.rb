class StudentsController < ApplicationController
  include SetSchoolAndStudent

  before_action :set_school
  before_action :set_student
  before_action :authenticate_student!

  def show
    authorize @student

    load_accessible_terms
    load_available_terms
  end

  private
  def student_id_param
    params.require(:id)
  end

  def set_student
    @student = @school.students.find(student_id_param)
  end

  def load_available_terms
    @available_terms = Term.where(school: @school)
                           .where.not(id: @student.term_ids)
  end

  def load_accessible_terms
    @accessible_terms  = @student.terms
  end
end
