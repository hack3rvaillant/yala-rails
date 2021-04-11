class Community < ApplicationRecord
  validates :name, presence: true
  validates :subdomain, presence: true
  validates :subdomain, uniqueness: true
  validates :subdomain, exclusion: {in: Subdomain::BLACKLIST}
  # TODO, validates :domain, format: {}

  has_many :users, dependent: :destroy
end
