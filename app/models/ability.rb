class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    else
      if user.member?
        can :read, MembershipApplication, :user_id => user.id
        can :create, Reservation
        can :read, Reservation, :user_id => user.id
        can :create, Score
        can :read, Score, :user_id => user.id
      elsif user.guest?
        can :create, MembershipApplication
      end
    end
  end
end
