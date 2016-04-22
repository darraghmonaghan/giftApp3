class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
      	@user = current_user
	 	groups = []
      	newsfeed_posts = []

	    @user.groups.each do | group |
	        groups.push(group)

	        group.posts.each do | posts |
	            newsfeed_posts.push(posts)

	            @sorted_newsfeed_posts = newsfeed_posts.sort_by do | item |
	            	item[:created_at]
	            end
	        end
	    end

      	# Sorting by Event Date
		@sorted_groups = @user.groups.sort_by do | item |
			item[:date]
		end
	end

	def show
	 	# if params[:id] !== current_user.id
	 	# 	redirect_to root_path
	 	# end

	end


end
