class School < ActiveRecord::Base
  has_many :teacher, dependent: :destroy
  has_many :student, dependent: :destroy
end
