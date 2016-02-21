class DashboardController < ApplicationController

	before_action :authenticate_user!

	def index

	end


	def show
	 	@group_ids = []
      	@newsfeed_posts = []

      	# Preparing groups invovled in      
      	@group_objects = []
      	@group_owner_objects = []
      	@user = current_user

      	# Preparing groups owner / organiser of
      	group_owner_objects = Group.where(:user_id => current_user.id)
      	group_owner_objects.each do | a |
        	@group_owner_objects.push(a)
      	end

	    @user.groups.each do | group |
	        @group_ids.push(group.id)

	        group.posts.each do | posts |
	            @newsfeed_posts.push(posts)
	        end
	    end


	end


end
