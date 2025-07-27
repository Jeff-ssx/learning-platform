class TermPolicy < ApplicationPolicy
  def show?
    user.school_id == record.school_id
  end
end
