class RestaurantsController < ApplicationController
  include Devise

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:new, :create]
  before_filter :credentials_filter, :only => [:edit, :destroy]


  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end


  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    #@user = User.new
    @owner = Owner.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.owner = current_owner


    respond_to do |format|
      #ovveride default save method with add
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  #Add owner param here.
  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :desc, :full_address, :phone, :avatar)
  end

  def credentials_filter
    owner = Restaurant.find(params[:id]).owner
    unless owner == current_owner
      flash[:message] = "Please login with the appropiate credentials"
      redirect_to :root
    end
  end
end
