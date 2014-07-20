class OwnersController < ApplicationController
	before_filter :authenticate_owner!

  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
    unless @owner == current_owner
      redirect_to :back, :alert => "Access denied."
    end
  end

end

