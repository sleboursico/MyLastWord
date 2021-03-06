class User < ActiveRecord::Base
  rolify


  before_create :default_values
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  as_enum :frequence, :semaine => 0, :mois=> 1

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :nom, :prenom, :dateNaissance, :frequence, :dateDerniereValidation


  has_many :contacts

  has_many :messages


  has_many :validations

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

  def default_values
    self.frequence = User.frequences.mois
    self.dateDerniereValidation=Date.current
  end

  def self.rappel
    for user in User.all()
      logger.debug "Traitement de user : #{user.id}"

      validation = Validation.create(:user => user );

      UserMailer.rappel(validation).deliver
      logger.debug "fin u traitement pour le user : #{user.id}"
    end
  end

  def date_prochain_rappel
    case self.frequence_cd
      when 0 ; return self.dateDerniereValidation + 7.days
      when 1 ; return self.dateDerniereValidation + 1.month
    end

  end
end
