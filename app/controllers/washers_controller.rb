class WashersController < ApplicationController
  def create
    @washer = Washer.new(washer_params)
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washer.laundromat = @laundromat

    if @washer.save
      flash[:notice] = 'Washer data successfully added!'
      redirect_to laundromat_path(@laundromat) + "#main"
    else
      flash[:notice] = 'You must be signed in to add washer data'
      redirect_to laundromat_path(@laundromat) + "#main"
    end
  end

  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washer = Washer.new
    unless user_signed_in?
      flash[:notice] = 'You must be signed in to add washer data'
      redirect_to laundromat_path(@laundromat) + "#main"
    end
  end

  def edit
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washer = Washer.find(params[:id])
  end

  def update
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washer = Washer.find(params[:id])
    @washer.laundromat = @laundromat
    if @washer.update(washer_params)
      flash[:notice] = 'Washer successfully edited!'
    end
    redirect_to laundromat_path(@laundromat) + "#main"
  end

  def destroy
    @washer = Washer.find(params[:id])
    @laundromat = Laundromat.find(params[:laundromat_id])
    @washer.destroy
    flash[:notice] = 'Washer deleted!'
    redirect_to laundromat_path(@laundromat) + "#main"
  end

  private

  def washer_params
    params.require(:washer).permit(
      :number_available
    )
  end
end
