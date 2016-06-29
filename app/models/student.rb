class Student < ActiveRecord::Base
  has_many :marks
  belongs_to :teacher
end
