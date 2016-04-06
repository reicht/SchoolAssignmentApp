class Teacher < ActiveRecord::Base
  belongs_to :school, counter_cache: true
  has_many :student, dependent: :destroy
end
