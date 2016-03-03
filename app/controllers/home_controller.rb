class HomeController < ApplicationController


	def show

	end

	def index
		if user_signed_in?
			redirect_to :controller => 'dashboard', :action => 'index'
		else
			redirect_to :controller => 'home', :action => 'show'
		end
	end


end
