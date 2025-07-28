class License < ApplicationRecord
  belongs_to :term
  belongs_to :student, optional: true

  enum status: {
    unused: 'unused',
    used: 'used'
  }

  validates :code, presence: true, uniqueness: true
  validates :term, presence: true
  validate :validate_update, on: :update

  def activate!(student)
    return false unless unused?
    return false unless student.school == term.school

    update!(
      student: student,
      status: :used
    )
  end

  def validate_update
    if status_was == 'used'
      errors.add(:status, 'cannot be modified once used.')
    end

    if status == 'used' && student.nil?
      errors.add(:student, 'must have a student when used.')
    end
  end

end
