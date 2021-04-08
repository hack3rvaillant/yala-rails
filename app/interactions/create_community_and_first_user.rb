class CreateCommunityAndFirstUser < ActiveInteraction::Base
  string :name, :subdomain, :username, :email, :password
  attr_accessor :community, :user

  validates :name, :subdomain, :username, :email, :password, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'format invalid' }

  def execute
    ActiveRecord::Base.transaction do
      self.community = Community.new(
        name: name,
        subdomain: subdomain
      )

      errors.merge!(community.errors) && raise(ActiveRecord::Rollback) unless community.save

      ActsAsTenant.with_tenant(community) do
        # Current tenant is set for all code in this block
        self.user = User.new(
          email: email,
          password: password,
          username: username
        )
      end

      errors.merge!(user.errors) && raise(ActiveRecord::Rollback) unless user.save
    end

    [user, community]
  end
end
