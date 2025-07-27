FactoryBot.define do
  factory :term_access do
    transient do
        school { create(:school) }
    end
  
    student { create(:student, school: school) }
    term { create(:term, school: school) }
    payment_method { :credit_card }
  end
end
