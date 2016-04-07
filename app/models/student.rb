class Student < ActiveRecord::Base
  validates :name, presence: true
  validates :teacher_id, presence: true
  belongs_to :school, counter_cache: true
  belongs_to :teacher, counter_cache: true
end
