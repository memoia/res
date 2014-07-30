class RestaurantsController < ApplicationController
  include Devise

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :ensure_owner_owns_restaurant, only: [:edit, :update, :destroy]

  # define instance variables you are going to use in your views

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end


  # GET /restaurants/1
  def show
    @reservation = Reservation.new
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    #@user = User.new
    @user = User.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user


    respond_to do |format|
      #ovveride default save method with add
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  #Add user param here.
  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :desc, :full_address, :phone, :avatar)
  end

  def credentials_filter
    user = Restaurant.find(params[:id]).user
    unless user == current_user
      flash[:message] = "Please login with the appropiate credentials"
      redirect_to :root
    end
  end

  def ensure_owner_owns_restaurant
    #TODO: undefined method error
    unless current_owner_owns_restaurant(@restaurant)
      flash[:alert] = "You can't edit restaurants you don't own"
      redirect_to restaurants_path
    end
  end

end
