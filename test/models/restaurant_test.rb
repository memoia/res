require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  

  test "restaurant attributes must not be empty" do
    restaurant = Restaurant.new(name: "Vitamin Restaurant",
    							desc: "Healthy Spot",
    							avatar: "zzz.jpg")

    restaurant = Restaurant.new
    assert restaurant.invalid?
    assert restaurant.errors[:name].any?
    assert restaurant.errors[:desc].any?
   end
end
