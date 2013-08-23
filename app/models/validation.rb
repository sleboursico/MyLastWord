class Validation < ActiveRecord::Base


  before_create :default_values

  as_enum :statut, :en_attente => 0, :valide => 1, :abandonne => 2

  attr_accessible :date, :statut, :user

  belongs_to :user



  def default_values

    self.date =  Time.now.to_datetime
    self.statut = Validation.statuts.en_attente
    self.generate_token
  end


  def generate_token
    self.token = string = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
