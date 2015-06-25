class SearchController < ApplicationController

	def index
		
	end

	def search
	  if params[:q].nil?
	    @articles = []
	  else
	    @customers = Customer.search params[:q]
	  end
	end	
end
