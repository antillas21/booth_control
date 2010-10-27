class CompaniesController < ApplicationController
  
  before_filter :find_company, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    @companies = Company.order("name asc")
  end
  
  def show
  end
  
  def new
    #@company = Company.new
    @company = current_user.companies.build
  end
  
  def create
    #@company = Company.new(params[:company])
    @company = current_user.companies.build(params[:company])
    if @company.save
      flash[:notice] = "Nueva Empresa agregado"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @company.update_attributes(params[:company])
      flash[:notice] = 'Empresa modificada'
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def destroy
    @company.destroy
    flash[:notice] = 'Empresa eliminada'
    redirect_to companies_path
  end
  
  private
  
  def find_company
    @company = Company.find(params[:id])
  end
  
end
