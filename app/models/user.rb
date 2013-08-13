class User < ActiveRecord::Base
  rolify
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :nom, :prenom, :dateNaissance


  has_many :contacts

  has_many :messages


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(prenom:auth.info.first_name,
                         nom:auth.info.last_name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(prenom: data["first_name"],  nom: data["last_name"],
                         email: data["email"],
                         password: Devise.friendly_token[0,20]
      )
    end
    user
  end

end
