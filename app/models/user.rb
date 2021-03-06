class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:facebook, :twitter]

	has_many :comments, as: :commentable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>", profile: "30x30" }, default_url: "profile.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = Devise.friendly_token[0,20]
      user.save!
  	end
  end
end
