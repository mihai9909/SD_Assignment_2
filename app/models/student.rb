class Student < User
  has_one :student_profile, dependent: :destroy
  has_many :attendances, foreign_key: :user_id
  has_many :laboratory_classes, through: :attendances
  has_many :assignments, through: :laboratory_classes
  has_many :submissions, foreign_key: :user_id
  accepts_nested_attributes_for :student_profile, update_only: true

  def active_for_authentication?
    super && self.student_profile.active?
  end

  def inactive_message
    "Sorry, this account is inactive."
  end
end
