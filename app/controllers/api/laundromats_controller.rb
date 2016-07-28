class Api::LaundromatsController < ApplicationController
  def index
    render json: Laundromat.all
  end

  def create
    @laundromat = Laundromat.new(laundromat_params)

    if @laundromat.save
      render json: { laundromat: @laundromat }
    else
      render json: { errors: "Did not work" }, status: :bad_request
    end
  end

  private

  def laundromat_params
    params.require(:laundromat).permit(:name, :address, :city, :state, :zip_code)
  end
end
