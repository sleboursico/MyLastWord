class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.nil? then
## Droit à rien, non mais...
    else
#can :manage, :all
      can :manage, Contact,      :id => 2
      can :manage, Message,   :id => 2
    end
  end
end
