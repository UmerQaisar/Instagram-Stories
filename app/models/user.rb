class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    token, expires_at = LongLivedToken.new.get(access_token: auth['credentials']['token'])
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    # user.email = auth.info.email
    # user.password = Devise.friendly_token[0, 20]
    if user.persisted?
      user.long_lived_access_token = token
      user.expiry_date = expires_at
      user.save!
    end
    user

    # find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0, 20]
    #   user.long_lived_access_token = token
    #   user.expiry_date = expires_at
    # end
  end
end
