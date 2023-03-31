class Student < User
  has_one :student_profile, dependent: :destroy
end
