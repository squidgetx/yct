class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil? || user.id.nil?
      # guest user
      can :read, Post
      can :read, Climber
      can :read, Event
      return
    end
    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
        can :manage, Post
        can :manage, Event
        can :manage, Climber
      when 'member' || 'moderator'
        can [:read, :create], Post
        can :read, Event
        can :edit, Post, climber_id: user.id
        can :edit, Climber, id: user.id
    end
  end
end
