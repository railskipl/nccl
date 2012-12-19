class Admin::DashboardController < ApplicationController
  
  layout "admin"
  
  before_filter :authenticate_admin!, :except => []
  
  
  def index
  end
  
end
