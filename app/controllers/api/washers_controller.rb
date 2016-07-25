class Api::WashersController < ApplicationController
  def index
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washers = @laundromat.washers
    render json: @washers
  end
end
