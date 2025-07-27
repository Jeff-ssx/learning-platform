class Student < ApplicationRecord
    belongs_to :school
    has_secure_password

    has_many :term_accesses, dependent: :destroy
    has_many :terms, through: :term_accesses

    validates :name, presence: true
    validates :school, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
end
