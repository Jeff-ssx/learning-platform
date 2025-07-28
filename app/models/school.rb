class School < ApplicationRecord
  has_many :students
  has_many :admins
  has_many :terms

  has_many :courses, through: :terms

  validates :name, presence: true, uniqueness: true
end
