class CourseEnrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  
  validates :student, presence: true
  validates :course, presence: true
  validates :course_id, uniqueness: { scope: :student_id }

  validate :student_and_course_belong_to_same_school

  private
  def student_and_course_belong_to_same_school
    return if student.nil? || course.nil?

    errors.add(:base, "Student and Course must belong to the same school") if student.school_id != course.term.school_id
  end
end
