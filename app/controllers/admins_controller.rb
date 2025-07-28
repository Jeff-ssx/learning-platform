class AdminsController < ApplicationController
  before_action :set_school, only: %i[ show ]
  before_action :authenticate_admin!
  # GET /dashboard
  def show
    @students_per_course = students_count_per_course
    @students_per_term = students_count_per_term
    @credit_card_enrollments = count_enrollments_by_method('credit_card')
    @license_enrollments = count_enrollments_by_method('license')
  end

  private
  def set_school
    @school = School.find(school_id_param)
  end

  def school_id_param
    params.require(:school_id)
  end

def students_count_per_course
  Course.joins(:term, :course_enrollments)
        .where(terms: { school_id: @school.id })
        .group('courses.id', 'courses.name')
        .count('course_enrollments.id')
end

  def students_count_per_term
    Term.joins(:term_accesses)
        .where(school: @school)
        .group('terms.id', 'terms.name')
        .count('term_accesses.id')
  end

  def count_enrollments_by_method(method)
    TermAccess.joins(:term)
              .where(terms: { school_id: @school.id }, payment_method: method)
              .count
  end
end
