class Message < ActiveRecord::Base
  attr_accessible :contenu, :titre, :user_id, :contact_ids


  has_and_belongs_to_many :contacts

  belongs_to :user
end
