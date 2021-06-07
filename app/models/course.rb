# Courses are just collections of activities
# They organize them into sections
# They
class Course < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :sections, dependent: :destroy
  acts_as_tenant :community

  accepts_nested_attributes_for :sections

  validates :title, presence: true
  validates :description, presence: true
end
