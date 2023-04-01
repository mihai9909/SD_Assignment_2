FactoryBot.define do
  factory :student_profile do
    token { SecureRandom.hex(128) }
    active { false }
  end
end
