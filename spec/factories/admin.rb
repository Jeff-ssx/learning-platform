FactoryBot.define do
  factory :admin do
    association :school
    name {"fn-#{rand(1000)}:ln-#{rand(1000)}"}
    email { "admin#{rand(1000)}@example.com" }
    password { "securepass" }
    password_confirmation { "securepass" }
  end
end
