class Admin::ContactsController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
  def index
    @contacts = Contact.find(:all, :order => 'id desc')
    
    respond_to do |format|
        format.html
        format.xml { render :xml => @contacts } 
      end
      
  end


  def show
    @contact = Contact.find(params[:id])
    respond_to do |format|
        format.html
        format.xml { render :xml => @contact } 
      end
  end
      

  def destroy
    @contact = Contact.find(params[:id])
   
    if @contact.destroy
      flash[:notice] = "Contact deleted successfully"
      redirect_to admin_contacts_path
    end
    
  end
  
end
