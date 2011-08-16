class PagesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:reserved_booths, :home]
  
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
  
  def export
    @companies = Company.all( :order => "#{companytable_columns(params[:iSortCol_0])} #{params[:sSortDir_0] || "ASC"}",
                        :limit => params[:iDisplayLength],
                        :offset => params[:iDisplayStart],
                        :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ])
     @iTotalRecords = Company.count
     @iTotalDisplayRecords = Company.count( :conditions => [ 'name LIKE ?', "%#{params[:sSearch]}%" ] )
     @sEcho = params[:sEcho].to_i
     #render :layout => false
     respond_to do  |format|
       format.json
       format.html { render :layout => false }
     end
  end
  
  def companytable_columns(column_id)
    case column_id.to_i
    when 0
      return "name"
    when 1
      return "id"
    end
  end
  
  def exportable
    @companies = Company.all
  end
  
end
