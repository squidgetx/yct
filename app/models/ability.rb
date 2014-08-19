class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil? || user.id.nil?
      # guest user
      can :read, Post
      can :read, Climber
      can :read, Event
      can :signup, Event do |event|
        public_signup &&
          event.start_date.to_date <= Date.current
      end
      return
    end
    case user.role
      when 'admin'
        can :manage, :all
      when 'moderator'
        can :manage, Post
        can :manage, Event
        can :manage, Climber
      when 'normal' || 'moderator'
        can [:read, :create], Post
        can :read, Event
        can :edit, Post, climber_id: user.id
        can :edit, Climber, id: user.id
        can :signup, Event do |event|
          event.start_date.to_date <= Date.current &&
            event.signup &&
            event.climbers.where("climber_id = ?",user.id).empty?
        end
    end
  end
end
