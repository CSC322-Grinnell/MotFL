# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 


#TODO: only admins can create new users
#TODO: set permissions for viewing of users. 

  #assigning permissions to roles
    if user.admin? 
    # admins can perform any action on any object
      can :manage, :all 
    elsif user.volunteer? 
    #volunteer can create and view resources. 
      can [:create, :read], ResourceMetadatum 
    else #non-volunteer and non-admin user
      #regular users can view all resources
      can :read, ResourceMetadatum
    end
  end
end
