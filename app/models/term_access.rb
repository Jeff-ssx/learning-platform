class TermAccess < ApplicationRecord
  enum payment_method: [:licience, :credit_card]

  belongs_to :student
  belongs_to :term
  
  validates :payment_method, presence: true
  validates :student, presence: true
  validates :term, presence: true
  validates :student_id, uniqueness: { scope: :term_id }

  validate :student_and_term_belong_to_same_school

  private
  def student_and_term_belong_to_same_school
    return if student.nil? || term.nil?

    errors.add(:base, "Student and Term must belong to the same school") if student.school_id != term.school_id
  end
end
