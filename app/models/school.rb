class School < ActiveRecord::Base
  validates :name, presence: true
  has_many :teacher, dependent: :destroy
  has_many :student, dependent: :destroy
end
