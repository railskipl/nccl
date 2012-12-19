class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id]) 
    
    @title = "#{@page.title}"
    @meta_title = "NAGPUR CHAMBER OF COMMERCE LIMITED - #{@page.meta_title}"
    @meta_keywords = "#{@page.meta_key}"
    @meta_description = "#{@page.meta_desc}"
  end
end
