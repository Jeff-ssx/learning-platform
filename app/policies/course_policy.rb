class CoursePolicy < ApplicationPolicy
  def show?
    user.school_id == record.term.school_id && user.terms.include?(record.term)
  end
end
