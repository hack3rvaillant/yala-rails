class CreateCommunityAndAdmin < ActiveInteraction::Base
  string :name, :slug, :username, :email, :password
  attr_accessor :community, :user

  validates :name, :slug, :username, :email, :password, presence: true
  validates :email,
    format: {with: URI::MailTo::EMAIL_REGEXP, message: "format invalid"}

  def execute
    ActiveRecord::Base.transaction do
      self.community = Community.new(
        name: name,
        slug: slug
      )

      errors.merge!(community.errors) && raise(ActiveRecord::Rollback) unless community.save

      ActsAsTenant.with_tenant(community) do
        # Current tenant is set for all code in this block
        self.user = User.new(
          email: email,
          password: password,
          username: username
        )
        user.add_role(:admin, community)
      end

      errors.merge!(user.errors) && raise(ActiveRecord::Rollback) unless user.save
    end

    [user, community]
  end
end
