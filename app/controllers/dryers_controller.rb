class DryersController < ApplicationController
  def create
    @dryer = Dryer.new(dryer_params)
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer.laundromat = @laundromat

    if @dryer.save
      flash[:notice] = 'Dryer data successfully added!'
      redirect_to laundromat_path(@laundromat) + "#main"
    else
      flash[:notice] = 'You must be signed in to add dryer data'
      redirect_to laundromat_path(@laundromat) + "#main"
    end
  end

  def new
    @laundromat = Laundromat.find(params[:laundromat_id])
    @dryer = Dryer.new
    unless user_signed_in?
      flash[:notice] = 'You must be signed in to add dryer data'
      redirect_to laundromat_path(@laundromat) + "#main"
    end
  end


  private

  def dryer_params
    params.require(:dryer).permit(
      :number_available
    )
  end
end
