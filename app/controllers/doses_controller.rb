class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def show
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
  end

  private

  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :id, :description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end
end
