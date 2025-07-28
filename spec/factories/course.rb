FactoryBot.define do
  factory :course do
    name { "course-#{rand(100)}" }
    association :term
  end
end
