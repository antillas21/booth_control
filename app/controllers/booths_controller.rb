class BoothsController < ApplicationController
  
  before_filter :find_booth, :only => [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @booths = Booth.all
    @booths_available = Booth.free
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @booths_available }
      format.js
      format.json { render :json => @booths_available }
    end
  end
  
  def show
  end
  
  def new
    @booth = Booth.new
  end
  
  def create
    @booth = Booth.new(params[:booth])
    if @booth.save
      flash[:notice] = "Nuevo Booth agregado"
      redirect_to booths_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @booth.update_attributes(params[:booth])
      flash[:notice] = 'Booth modificado'
      redirect_to booths_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @booth.destroy
    flash[:notice] = 'Booth eliminado'
    redirect_to booths_path
  end
  
  private
  
  def find_booth
    @booth = Booth.find(params[:id])
  end
  
end
