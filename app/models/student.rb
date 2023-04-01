class Student < User
  has_one :student_profile, dependent: :destroy
  accepts_nested_attributes_for :student_profile
end
