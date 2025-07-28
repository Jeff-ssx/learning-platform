FactoryBot.define do
  factory :license do
    association :term
    code {"license-#{rand(1000)}" }
    status { "unused" }
  end
end
