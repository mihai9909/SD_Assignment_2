class Assignment < ApplicationRecord
  belongs_to :laboratory_class
  has_many :submissions, dependent: :destroy
end
