class Challenge < ApplicationRecord
  acts_as_tenant :community
  belongs_to :section

  validates :title, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :language, inclusion: {in: Language.all}
end
