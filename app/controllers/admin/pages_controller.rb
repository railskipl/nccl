class Admin::PagesController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
    def index
      @pages = Page.order('id desc').paginate(:per_page => 5, :page => params[:page])
      
      respond_to do |format|
          format.html
          format.xml { render :xml => @pages } 
        end
        
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(params[:page])
      if @page.save
        flash[:notice] = "Pages created successfully"
        redirect_to admin_pages_path
      else
        render :new
      end
    end
    
    def edit
      @page = Page.find(params[:id])
      respond_to do |format|
          format.html
          format.xml { render :xml => @page } 
        end
    end

    def update
      @page = Page.find(params[:id])
      if @page.update_attributes(params[:page])
        flash[:notice] = "Pages updated successfully"
        redirect_to admin_pages_path
      else
        render :edit
      end
    end
    

    def destroy
      @page = Page.find(params[:id])
     
      if @page.destroy
        flash[:notice] = "Pages deleted successfully"
        redirect_to admin_pages_path
      end
      
    end
    
end
