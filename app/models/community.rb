class Community < ApplicationRecord
  resourcify
  validates :name, presence: true
  validates :slug, presence: true
  validates :slug, uniqueness: true
  validates :slug, exclusion: {in: Slug.forbidden}

  has_many :users, dependent: :destroy

  def to_param
    return nil unless persisted?
    slug
  end
end
