class Admin::PressesController < ApplicationController
   layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
    def index
      @presses = Press.find(:all, :order => 'id desc')
      
      respond_to do |format|
          format.html
          format.xml { render :xml => @presses } 
        end
        
    end

    def new
      @press = Press.new
    end

    def create
      @press = Press.new(params[:press])
      if @press.save
        flash[:notice] = "presss created successfully"
        redirect_to admin_presses_path
      else
        render :new
      end
    end
    
    def show
      @press = Press.find(params[:id])
       respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @press }
    end
    end
    
    def edit
      @press = Press.find(params[:id])
      respond_to do |format|
          format.html
          format.xml { render :xml => @press } 
        end
    end

    def update
      @press = Press.find(params[:id])
      if @press.update_attributes(params[:press])
        flash[:notice] = "presss updated successfully"
        redirect_to admin_presses_path
      else
        render :edit
      end
    end
    

    def destroy
      @press = Press.find(params[:id])
     
      if @press.destroy
        flash[:notice] = "presss deleted successfully"
        redirect_to admin_presses_path
      end
      
    end
    
end
