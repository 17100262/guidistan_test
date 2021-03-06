class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # alias_action :read,:destroy
    # alias_action :index, :to => :index
    # alias_action :show, :to => :show
    user ||= User.new # guest user (not logged in)
    if user.has_role?(:admin)
      can :manage, :all
      cannot :update, Post
      cannot :update, Comment
      can :update, Post, :user_id => user.id
      can :update, Comment, :user_id => user.id
    elsif user.has_role?(:moderator)
      can :manage, Post
      can :manage, Comment
      can :create, FlaggedPost
      can :create, InterestedUser
      cannot :update, Post
      cannot :update, Comment
      can :update, Post, :user_id => user.id
      can :update, Comment, :user_id => user.id
      cannot :read, InterestedUser
    else
      can :create, Post
      can :create, Comment
      can :create, FlaggedPost
      
      can :update, Post,:user_id => user.id
      can :destroy, Post, :user_id => user.id
      can :destroy, Comment, :user_id => user.id
      can :update, Comment, :user_id => user.id
      can :read, :all
      # cannot :read, InterestedUser
      # cannot :read, Subdiscipline
      can :create, InterestedUser
      cannot :read, [:tag,City]
      cannot :read, InterestedUser
      cannot :read, FlaggedPost
      cannot :index, Profile
      
      can :upvote, Post
      can :downvote, Post
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
