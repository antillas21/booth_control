class ContactsController < ApplicationController
  
  before_filter :find_company_first
  before_filter :find_contact, :only => [:edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def new
    @contact = @company.build_contact
  end
  
  def create
    @contact = @company.build_contact(params[:contact])
    if @contact.save
      flash[:notice] = "Nuevo contacto agregado"
      redirect_to @company
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
    
    if @contact.update_attributes(params[:contact])
      flash[:notice] = 'Contacto modificado'
      redirect_to @company
    else
      render 'edit'
    end
  end
  
  def destroy
    @contact.destroy
    flash[:notice] = 'Contacto eliminado'
    redirect_to @company
  end
  
  private
  
  def find_company_first
    @company = Company.find(params[:company_id])
  end
  
  def find_contact
    @contact = @company.contact
  end
end
