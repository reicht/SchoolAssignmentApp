class Teacher < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :school, counter_cache: true
  has_many :student, dependent: :destroy
end
