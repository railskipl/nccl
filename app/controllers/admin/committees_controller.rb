class Admin::CommitteesController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
  def index
    @committee_type_id = CommitteeType.find(params[:committee_type_id])
    
    @committees = Committee.find_all_by_committee_type_id(@committee_type_id, :order => 'id asc')
    
    respond_to do |format|
        format.html
        format.xml { render :xml => @committees } 
      end
      
  end

  def new
    @committee_type_id = CommitteeType.find(params[:committee_type_id])
    @committee = Committee.new
  end

  def create
    @committee = Committee.new(params[:committee])
    if @committee.save
      flash[:notice] = "Committee member added successfully"
      redirect_to admin_committee_type_committees_path(@committee.committee_type_id)
    else
      render :new
    end
  end
  
  def edit
    @committee_type_id = CommitteeType.find(params[:committee_type_id])
    @committee = Committee.find(params[:id])
    respond_to do |format|
        format.html
        format.xml { render :xml => @committee } 
      end
  end

  def update
    @committee = Committee.find(params[:id])
    if @committee.update_attributes(params[:committee])
      flash[:notice] = "Committee member updated successfully"
      redirect_to admin_committee_type_committees_path(@committee.committee_type_id)
    else
      render :edit
    end
  end
  
  
  def show
    @committee = Committee.find(params[:id])
    respond_to do |format|
        format.html
        format.xml { render :xml => @committee } 
      end
  end
  

  def destroy
    @committee = Committee.find(params[:id])
   
    if @committee.destroy
      flash[:notice] = "Committee member deleted successfully"
      redirect_to admin_committee_type_committees_path(@committee.committee_type_id)
    end
    
  end
  
end
