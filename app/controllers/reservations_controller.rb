class ReservationsController < ApplicationController
  before_filter :find_company_first
  before_filter :authenticate_user!
  
  def new
    #@company = Company.find(params[:company_id])
    @reservation = @company.reservations.build
  end
  
  def create
    #@company = Company.find(params[:company_id])
    @reservation = @company.reservations.build(params[:reservation])
    if @reservation.save
      @reservation.booth.update_attributes(:available => false)
      flash[:notice] = "Nuevo booth reservado"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def destroy
    #@company = Company.find(params[:company_id])
    @reservation = @company.reservations.find(params[:id])
    @reservation.booth.update_attributes(:available => true)
    @reservation.destroy
    flash[:notice] = 'Reservacion eliminada'
    redirect_to @company
  end
  
  private
  
  def find_company_first
    @company = Company.find(params[:company_id])
  end
  
end
