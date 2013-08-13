class Contact < ActiveRecord::Base
  has_and_belongs_to_many :messages

  belongs_to :user
  attr_accessible :mail, :nom, :prenom, :user_id

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  telephone_regex = /\\d+/i
  validates :nom ,:presence => true     ,
            :length   => { :maximum => 50 }              ;
  validates :prenom ,:presence => true               ;
  validates :mail ,:presence => true    ,
            :format   => { :with => email_regex }


  def getNomCompletEtAdresse
    return prenom + " "+nom+" ("+mail+")"
  end
end
