class Api::V1::LaundromatsController < ApplicationController
  def index
    render json: Laundromat.all
  end
end
