class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :meta_defaults
    private

    def meta_defaults
      @meta_title = "Nagpur Chamber Of Commerce Limited."
      @meta_keywords = "Nagpur Chamber Of Commerce Limited"
      @meta_description = "Nagpur Chamber Of Commerce Limited"
    end
end
