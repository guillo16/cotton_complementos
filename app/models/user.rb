class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :charges
  after_create :send_welcome_email
  has_many :payments
  has_many :shipping

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_provider_data(provider_data)
     where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
        user.skip_confirmation!
      end
  end

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
