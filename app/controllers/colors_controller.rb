class ColorsController < ApplicationController
  
  before_filter :find_color, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    @colors = Color.order("name asc")
  end
  
  def show
  end
  
  def new
    @color = Color.new
  end
  
  def create
    @color = Color.new(params[:color])
    if @color.save
      flash[:notice] = "Nuevo color agregado"
      redirect_to colors_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @color.update_attributes(params[:color])
      flash[:notice] = 'Color modificado'
      redirect_to colors_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @color.destroy
    flash[:notice] = 'Color eliminado'
    redirect_to colors_path
  end
  
  private
  
  def find_color
    @color = Color.find(params[:id])
  end
end
