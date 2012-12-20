require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class MainController < ApplicationController
  
  def index
    
     # Market News
      source_market = "http://feeds.business-standard.com/rss/48.xml" # url or local file
      content_market = "" # raw content of rss feed will be loaded here
      open(source_market) do |s| content_market = s.read end

        @rss_market = RSS::Parser.parse(content_market, false)
        @markets = @rss_market.items.first(3)
        
      # Banking News
        source_banking = "http://feeds.business-standard.com/rss/3_0.xml" # url or local file
        content_banking = "" # raw content of rss feed will be loaded here
        open(source_banking) do |s| content_banking = s.read end

          @rss_banking = RSS::Parser.parse(content_banking, false)
          @bankings = @rss_banking.items.first(3)
          
      
      # Economy News
        source_economy = "http://feeds.business-standard.com/rss/4_0.xml" # url or local file
        content_economy = "" # raw content of rss feed will be loaded here
        open(source_economy) do |s| content_economy = s.read end

          @rss_economy = RSS::Parser.parse(content_economy, false)
          @economies = @rss_economy.items.first(3)
          
      # Companies News
        source_company = "http://feeds.business-standard.com/rss/2_0.xml" # url or local file
        content_company = "" # raw content of rss feed will be loaded here
        open(source_company) do |s| content_company = s.read end

           @rss_company = RSS::Parser.parse(source_company, false)
           @companies = @rss_company.items.first(3)

        
  end
  
  def contact
        if request.post? and params[:contact]
    	      if @contact = Contact.new(params[:contact])

    	        @contact.name = "#{params[:contact][:name]}"
    	        @contact.email = "#{params[:contact][:subject]}"
    	        @contact.email = "#{params[:contact][:email]}"
    	        @contact.message = "#{params[:contact][:message]}" 
    	        
    	        if @contact.save


    	        Emailer.contact_email(@contact).deliver

              flash[:notice] = "Thanks for your enquiry. We will get back to you soon."
    	        redirect_to("/")
  	        else
  	          render :contact
	          end

    	      end

    	   else
    	     @title = "contacts"
  	     end
  end
end
