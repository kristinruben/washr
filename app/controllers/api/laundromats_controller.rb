class Api::LaundromatsController < ApplicationController
  def index
    render json: Laundromat.all
  end
end
