class PagesController < ApplicationController
  def home
    @title = 'Booth Control'
  end
  
  def reserved_booths
    @booths = Booth.order("booth_number asc")
    respond_to do |format|
      format.xml
    end
  end
  
end
