class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
      	@user = current_user
	 	groups = []
      	@newsfeed_posts = []

	    @user.groups.each do | group |
	        groups.push(group)

	        group.posts.each do | posts |
	            @newsfeed_posts.push(posts)
	        end
	    end


      	# Sorting by Event Date
		@sorted_groups = @user.groups.sort_by do | item |
			item[:date]
		end
      	
      	puts 'sorted group objects here!!!!!.......!!!!!'
      	puts @sorted_groups

	end






	def show
	 	# if params[:id] !== current_user.id
	 	# 	redirect_to root_path
	 	# end

	end


end
