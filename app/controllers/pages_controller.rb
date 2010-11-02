class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:reserved_booths]
  
  def home
    @title = 'Booth Control'
  end
  
  def welcome
    @title = "Bienvenido #{current_user.name}"
    @booths = Booth.reserved
  end
  
  def reserved_booths
    @map = Map.first
    @booths = Booth.order("booth_number asc")
    respond_to do |format|
      format.xml
    end
  end
  
end
