class School < ApplicationRecord
  has_many :students
  has_many :terms

  validates :name, presence: true, uniqueness: true
end
