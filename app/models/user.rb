class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  include Devise::Models::ValidatableCustom
  acts_as_tenant :community

  validates :username, presence: true
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'format invalid' }

  # validates_uniqueness_to_tenant :email, case_sensitive: false
end
