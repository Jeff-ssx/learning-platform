FactoryBot.define do
  factory :term do
    association :school
    name { "term-#{rand(1000)}" }
  end
end
