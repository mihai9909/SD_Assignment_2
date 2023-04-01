class LaboratoryClass < ApplicationRecord
  belongs_to :teacher, foreign_key: :user_id
  has_many :attendances
  has_many :students, through: :attendances
end
