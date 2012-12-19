class MainController < ApplicationController
  
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
