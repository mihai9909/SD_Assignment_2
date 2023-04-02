class Attendance < ApplicationRecord
  enum status: { to_decide: 0, absent: 1, present: 2, late: 3, excused: 4 }
  belongs_to :student, foreign_key: :user_id, optional: false
  belongs_to :laboratory_class, optional: false
  validates_uniqueness_of :user_id, :scope => :laboratory_class_id, message: "and laboratory pair already exists"
end
