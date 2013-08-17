class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, [House, Person, Rental], :user_id => user.id
    else
      #no actions
    end
  end
end
