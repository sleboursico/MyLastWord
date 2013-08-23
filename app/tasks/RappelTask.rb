class RappelTask
  def self.rappel
    for user in User.all()
      logger.debug "Traitement de user : #{user.id}"
    end
  end
end
