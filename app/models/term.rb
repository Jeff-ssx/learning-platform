class Term < ApplicationRecord
    belongs_to :school

    has_many :term_accesses, dependent: :destroy
    has_many :students, through: :term_accesses

    validates :school, presence: true
    validates :name, presence: true, uniqueness: { scope: :school_id }
end
