class CountriesController < ApplicationController
  
  before_filter :find_country, :except => [:index, :new, :create]
  
  def index
    @countries = Country.ordered(:conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
      format.js
    end
    @title = "Paises"
  end

  def new
    @country = Country.new
    @title = "Agregar Pais"
  end
  
  def create
    @country = Country.new(params[:country])
    if @country.save
      flash[:notice] = "Nuevo pais agregado"
      redirect_to countries_path
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    
  end
  
  def update
    
    if @country.update_attributes(params[:country])
      flash[:notice] = "Pais modificado exitosamente"
      redirect_to countries_path
    else
      render 'edit'
    end
  end

  def destroy
    
    @country.destroy
    flash[:notice] = "Pais eliminado exitosamente"
    redirect_to countries_path
  end
  
  private
  
  def find_country
    @country = Country.find(params[:id])
  end
  
end
