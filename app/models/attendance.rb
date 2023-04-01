class Attendance < ApplicationRecord
  enum status: { to_decide: 0, absent: 1, present: 2, late: 3, excused: 4 }
  belongs_to :student, foreign_key: :user_id, optional: false
  belongs_to :laboratory_class, optional: false
end
