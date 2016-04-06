class Student < ActiveRecord::Base
  belongs_to :school, counter_cache: true
  belongs_to :teacher, counter_cache: true
end
