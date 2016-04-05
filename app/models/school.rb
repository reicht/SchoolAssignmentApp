class School < ActiveRecord::Base
  has_many :teacher
  has_many :student
end
