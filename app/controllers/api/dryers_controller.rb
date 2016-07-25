class Api::DryersController < ApplicationController
  def index
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryers = @laundromat.dryers
    render json: @dryers
  end
end
