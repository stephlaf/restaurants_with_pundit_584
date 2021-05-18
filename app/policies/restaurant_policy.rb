class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  # def edit?
  #   # If @restaurant.user == current_user => true
  #   # Else => false
  #   # Pundit: user == current_user
  #   # Pundit: record == @restaurant (instance passed to the authorize method)
  #   record.user == user
  # end

  def update?
    user_owner_or_admin?
  end

  def destroy?
    user_owner_or_admin?
  end

  private

  def user_owner_or_admin?
    record.user == user || user.admin
  end
end
