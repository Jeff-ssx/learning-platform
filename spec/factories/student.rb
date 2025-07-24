FactoryBot.define do
  factory :student do
    association :school
    name {"fn-#{rand(1000)}:ln-#{rand(1000)}"}
    email { "student#{rand(1000)}@example.com" }
    password { "securepass" }
    password_confirmation { "securepass" }
  end
end
