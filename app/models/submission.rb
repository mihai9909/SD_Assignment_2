class Submission < ApplicationRecord
  belongs_to :student, foreign_key: :user_id, optional: false
  belongs_to :assignment, optional: false
  validates_uniqueness_of :user_id, :scope => :assignment_id, message: "already created a submission for this assignment"
end