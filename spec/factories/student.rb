FactoryBot.define do
  factory :student do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    student_profile { build(:student_profile) }
  end
end
