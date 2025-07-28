class Course < ApplicationRecord
    belongs_to :term

    has_many :course_enrollments, dependent: :destroy
    has_many :students, through: :course_enrollments

    validates :term, presence: true
    validates :name, presence: true, uniqueness: { scope: :term_id }
end
