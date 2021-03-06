class LaundromatsController < ApplicationController

  def index
    @laundromats = Laundromat.all
  end

  def show
    @laundromat = Laundromat.find(params[:id])
    @washer = Washer.all.last
    @dryer = Dryer.all.last
  end

  def new
    @laundromat = Laundromat.new
    @submit = "Add Laundromat"

    unless user_signed_in?
      flash[:error] = "You must be signed in to add a new laundromat."
      redirect_to laundromats_path(:anchor => "main")
    end
  end

  def create
    @laundromat = Laundromat.new(laundromat_params)
    if @laundromat.save
      flash[:notice] = "Laundromat successfully added!"
      redirect_to "/laundromats/#{@laundromat.id}/#main"
    else
      flash[:notice] = "There were problems saving your laundromat."
      flash[:errors] = @laundromat.errors.full_messages.join(", ")
      redirect_to new_laundromat_path(:anchor => "main")
    end
  end

  def edit
    @laundromat = Laundromat.find(params[:id])
    @submit = "Save Changes"
  end

  def update
    @laundromat = Laundromat.find(params[:id])
    @laundromat.update(laundromat_params)
    if @laundromat.save
      flash[:notice] = "Laundromat successfully saved!"
      redirect_to "/laundromats/#{@laundromat.id}/#main"
    else
      flash[:notice] = "There were problems saving your laundromat."
      flash[:errors] = @laundromat.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    Laundromat.destroy(params[:id])
    if !@laundromat
      flash[:notice] = "Laundromat deleted"
      redirect_to laundromats_path(:anchor => "main")
    else
      render :show
    end
  end

  # def search
  #   @laundromats = Laundromat.search(params[:query])
  # end

  private

  def laundromat_params
    params.require(:laundromat).permit(:name, :address, :city, :state, :zip_code, :washers, :dryers)
  end

end
