class Admin::CommitteeTypesController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
  def index
    @committee_types = CommitteeType.find(:all, :order => 'id asc')
    
    respond_to do |format|
        format.html
        format.xml { render :xml => @committee_types } 
      end
      
  end

  def new
    @committee_type = CommitteeType.new
  end

  def create
    @committee_type = CommitteeType.new(params[:committee_type])
    if @committee_type.save
      flash[:notice] = "Committee member added successfully"
      redirect_to admin_committees_path
    else
      render :new
    end
  end
  
  def edit
    @committee_type = CommitteeType.find(params[:id])
    respond_to do |format|
        format.html
        format.xml { render :xml => @committee_type } 
      end
  end

  def update
    @committee_type = CommitteeType.find(params[:id])
    if @committee_type.update_attributes(params[:committee_type])
      flash[:notice] = "Committee member updated successfully"
      redirect_to admin_committee_types_path
    else
      render :edit
    end
  end
  
  
  def show
    @committee_type = CommitteeType.find(params[:id])
    respond_to do |format|
        format.html
        format.xml { render :xml => @committee_type } 
      end
  end
  

  def destroy
    @committee_type = CommitteeType.find(params[:id])
   
    if @committee_type.destroy
      flash[:notice] = "Committee member deleted successfully"
      redirect_to admin_committee_types_path
    end
    
  end
  
end
