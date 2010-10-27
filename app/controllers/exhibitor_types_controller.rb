class ExhibitorTypesController < ApplicationController
  
  before_filter :find_exhibitor_type, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    @exhibitor_types = ExhibitorType.order("name asc")
  end
  
  def show
  end
  
  def new
    @exhibitor_type = ExhibitorType.new
  end
  
  def create
    @exhibitor_type = ExhibitorType.new(params[:exhibitor_type])
    if @exhibitor_type.save
      flash[:notice] = "Nuevo Tipo de Expositor agregado"
      redirect_to exhibitor_types_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @exhibitor_type.update_attributes(params[:exhibitor_type])
      flash[:notice] = 'Tipo de Expositor modificado'
      redirect_to exhibitor_types_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @exhibitor_type.destroy
    flash[:notice] = 'Tipo de Expositor eliminado'
    redirect_to exhibitor_types_path
  end
  
  private
  
  def find_exhibitor_type
    @exhibitor_type = ExhibitorType.find(params[:id])
  end
end
