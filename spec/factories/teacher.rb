FactoryBot.define do
  factory :teacher do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
