class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id]) 
    
    @title = "#{@page.title}"
    @meta_title = "Nagpur Chamber Of Commerce Limited - #{@title}"
    
  end
end
