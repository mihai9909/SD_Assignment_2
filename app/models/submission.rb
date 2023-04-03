class Submission < ApplicationRecord
  belongs_to :student, foreign_key: :user_id, optional: false
  belongs_to :assignment, optional: false
  validates :grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }, allow_nil: true
  validates_uniqueness_of :user_id, :scope => :assignment_id, message: "already created a submission for this assignment"
end
