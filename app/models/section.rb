class Section < ApplicationRecord
  belongs_to :course
  acts_as_tenant :community
  has_many :challenges, dependent: :destroy

  accepts_nested_attributes_for :challenges
end
