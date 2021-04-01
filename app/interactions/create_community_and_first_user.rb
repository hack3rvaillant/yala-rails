class CreateCommunityAndFirstUser < ActiveInteraction::Base
  string :name, :subdomain, :username, :email, :password
  attr_accessor :community, :user

  validates :name, :subdomain, :username, :email, :password, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'format invalid' }

  validate :email_is_unique

  def execute
    self.community = Community.new(
      name: name,
      subdomain: subdomain
    )

    self.user = User.new(
      email: email,
      password: password,
      username: username
    )

    ActiveRecord::Base.transaction do
      errors.merge!(community.errors) && raise(ActiveRecord::Rollback) unless community.save
      errors.merge!(user.errors) && raise(ActiveRecord::Rollback) unless user.save
    end

    [user, community]
  end

  private

  def email_is_unique
    return true unless User.find_by(email: email).present?
    errors.add(:email, 'is already taken')
    false
  end
end
