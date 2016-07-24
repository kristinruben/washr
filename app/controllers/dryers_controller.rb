class DryersController < ApplicationController
  def create
    @dryer = Dryer.new(dryer_params)
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer.laundromat = @laundromat

    if @dryer.save
      flash[:notice] = 'Dryer data successfully added!'
      redirect_to laundromat_path(@laundromat)
    else
      flash[:notice] = 'You must be signed in to add dryer data'
      redirect_to laundromat_path(@laundromat)
    end
  end

  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer = Dryer.new
    unless user_signed_in?
      flash[:notice] = 'You must be signed in to add dryer data'
      redirect_to laundromat_path(@laundromat)
    end
  end

  def edit
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer = Dryer.find(params[:id])
  end

  def update
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer = Dryer.find(params[:id])
    @dryer.laundromat = @laundromat
    if @dryer.update(washer_params)
      flash[:notice] = 'Dryer successfully edited!'
    end
    redirect_to laundromat_path(@laundromat)
  end

  def destroy
    @dryer = Dryer.find(params[:id])
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer.destroy
    flash[:notice] = 'Dryer deleted!'
    redirect_to laundromat_path(@laundromat)
  end

  private

  def dryer_params
    params.require(:dryer).permit(
      :number_available
    )
  end
end
