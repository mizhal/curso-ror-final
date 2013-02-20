class Ability
  include CanCan::Ability

  def initialize(user)
    unless user.blank?
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :landlord
        can :subcategories, Category
        can [:create, :update, :index, :destroy, :provinces], Accommodation, 
          :landlord_id => user.id
        can :create, [Offer, RoomType]
        can :manage, [Offer, RoomType], :accommodation => {:landlord_id => user.id}
      end
      can [:show, :update], User, :id => user.id
    end
    
    can :create, User
    can [:show, :home, :public_index, :global_map], Accommodation
    can :show, [RoomType, Offer]
    can :public_index, Offer
    
  end
end
