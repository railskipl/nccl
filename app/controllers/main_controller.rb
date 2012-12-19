require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

class MainController < ApplicationController
  
  def index
     source = "http://feeds.business-standard.com/rss/48.xml" # url or local file
     content = "" # raw content of rss feed will be loaded here
      open(source) do |s| content = s.read end

        @rss = RSS::Parser.parse(content, false)
        @feed = @rss.items
        @feeds = @feed
        
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
