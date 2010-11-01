class OfficesController < ApplicationController
  
  before_filter :find_company_first
  before_filter :find_office, :only => [:edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def new
    @office = @company.build_office
  end
  
  def create
    @office = @company.build_office(params[:office])
    if @office.save
      flash[:notice] = "Nueva direccion agregada"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @office.update_attributes(params[:office])
      flash[:notice] = 'Direccion modificada'
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def destroy    
    @office.destroy
    flash[:notice] = 'Direccion eliminada'
    redirect_to @company
  end
  
  private
  
  def find_company_first
    @company = Company.find(params[:company_id])
  end
  
  def find_office
    @office = @company.office
  end
  
end
