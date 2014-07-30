class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:new, :show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:destroy, :edit]
  before_action :find_restaurant, only: [:create, :index]

  # GET /reservations
  def index
    #@reservations = Reservation.all
    @reservations = Reservation.where(:restaurant_id => @restaurant.id).sort
    #@reservations = @restaurant.reservations.sort //equivalant as line above
  end

  # GET /reservations/1
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new({:restaurant_id => @restaurant.id, :name => "default"})
    #@reservation = @restaurant.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  def create
    #@reservation = Reservation.new(reservation_params)
    #@reservation = @restaurant.reservations.build params[:reservation]
    @reservation = @restaurant.reservations.new(reservation_params)


    respond_to do |format|
      if @reservation.save
        format.html { redirect_to restaurant_reservation_path(@reservation.restaurant_id, @reservation.id), notice: 'Reservation was successfully created.' }
        #redirect_to(:action => 'show', :reservation_id => @reservation.id, :restaurant_id => @restaurant.id), alert: "Reservation created")
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /reservations/1
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reservations/1
  def destroy
    #@reservation.destroy
    #TODO: anyone can destroy anyone else's reservation.
    Reservation.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Reservation was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def find_restaurant
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:email, :requested_date, :message, :restaurant_id, :confirmed)
  end

end
