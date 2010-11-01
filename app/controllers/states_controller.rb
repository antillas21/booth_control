class StatesController < ApplicationController
  before_filter :find_state, :except => [:index, :new, :create]
  
  def index
    @states = State.ordered(:conditions => ['name LIKE ?', "%#{params[:search]}%"])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
      format.js
      format.json { render :json => @states }
    end
  end
  
  def show
    
  end

  def new
    @state = State.new
    @title = "Agregar Estado"
  end

  def create
    @state = State.new(params[:state])
    if @state.save
      flash[:notice] = "Nuevo estado agregado"
      redirect_to states_path
    else
      render 'new'
    end
  end

  def edit
    
    @title = "Editar Estado"
  end

  def update
    
    if @state.update_attributes(params[:state])
      flash[:notice] = "Estado modificado exitosamente"
      redirect_to states_path
    else
      render 'edit'
    end
  end

  def destroy
    
    @state.destroy
    flash[:notice] = "Estado eliminado exitosamente"
    redirect_to states_path
  end
  
  private
  
  def find_state
    @state = State.find(params[:id])
  end
  
end
