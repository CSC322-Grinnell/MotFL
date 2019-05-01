# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 

# this is where their permissions are actually assigned
    if user.admin? 
      can :manage, :all # user can perform any action on any object
    elsif user.volunteer? 
      can [:create, :update], resource_metadatum #volunteer can create and update resources
      cannot :destroy, resource_metadatum #volunteer cannot destroy resources
      cannot :create, tag #volunteer cannot create new tags
      cannot :destroy, user
      cannot :edit, user
    else #not sure if we need this part or not
      can :read, :all # user can read any object
      cannot :destroy, resource_metadatum
    end
  end
end
