class Teacher < User
  has_many :laboratory_classes, foreign_key: :user_id
  has_many :assignments, through: :laboratory_classes
end
