class PressesController < ApplicationController
  def index
     @presses = Press.find(:all, :order=>"id desc") 
     
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
            
            @meta_title = "Nagpur Chamber Of Commerce Limited - Press Release"
  end
end
