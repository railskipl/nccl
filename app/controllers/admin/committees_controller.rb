class Admin::CommitteesController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
  def index
    @committees = Committee.find(:all, :order => 'id asc')
    
    respond_to do |format|
        format.html
        format.xml { render :xml => @committees } 
      end
      
  end

  def new
    @committee = Committee.new
  end

  def create
    @committee = Committee.new(params[:committee])
    if @committee.save
      flash[:notice] = "Committee member added successfully"
      redirect_to admin_committees_path
    else
      render :new
    end
  end
  
  def edit
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
      redirect_to admin_committees_path
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
      redirect_to admin_committees_path
    end
    
  end
  
end
