class DashboardController < ApplicationController

	before_filter :authenticate_user!

	def index
      	@user = current_user
	 	groups = []
      	@newsfeed_posts = []
      	@groups_involved = []
      	@group_owner_objects = []


      	# Preparing groups owner / organiser of
      	group_owner_objects = Group.where(:user_id => current_user.id)
      	group_owner_objects.each do | a |
        	@group_owner_objects.push(a)
      	end

	    @user.groups.each do | group |
	        groups.push(group)

	        group.posts.each do | posts |
	            @newsfeed_posts.push(posts)
	        end
	    end


      	# Preparing groups invovled in      
      	groups.each do | group |
      		if group.user_id != @user.id
      			@groups_involved.push(group)
      		end
      	end


      	puts 'involved groups here....'
      	puts @groups_involved

	end


	def show
	 	# if params[:id] !== current_user.id
	 	# 	redirect_to root_path
	 	# end

	end


end
