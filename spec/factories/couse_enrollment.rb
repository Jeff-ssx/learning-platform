FactoryBot.define do
  factory :course_enrollment do
    transient do
        school { create(:school) }
        term { create(:term, school: school) }
    end
  
    student { create(:student, school: school) }
    course { create(:course, term: term) }
  end
end
