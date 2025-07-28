class CourseEnrollmentsController < ApplicationController
  include SetSchoolAndStudent
  before_action :set_school
  before_action :set_student
  before_action :set_course, only: [:new, :create]
  before_action :set_term, only: [:new, :create]
  before_action :authenticate_student!

  # GET /course_enrollments/new
  def new
    @course_enrollment = CourseEnrollment.new
  end


  # POST /course_enrollments or /course_enrollments.json
  def create

    builder = CourseEnrollmentBuilder.new(
        student: @student,
        course: @course
    )

    if builder.call
        # success
        redirect_to school_student_term_path(@school, @student, @course.term)
    else
        # fail
        @course_enrollment = CourseEnrollment.new
        render :new
    end
  end

  private
    def set_term
      @term = @course.term
    end

    def set_course
      @course = Course.find(course_id)
    end

    def course_id
      params.require(:course_id)
    end
end
