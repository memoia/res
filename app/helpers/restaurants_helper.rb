module RestaurantsHelper
  def current_owner_owns_restaurant(restaurant)
    if current_user && restaurant.user == current_user
      true
    else
      false
    end
  end
end
