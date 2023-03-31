class StudentProfile < ApplicationRecord
  belongs_to :student, foreign_key: :student_id
end
