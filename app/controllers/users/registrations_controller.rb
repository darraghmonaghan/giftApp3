class Users::RegistrationsController < Devise::RegistrationsController


	def new
		super do
			@token = params[:invite_token]
		end
	end


	def create
	  @newUser = build_user(user_params)
	  @newUser.save
	  @token = params[:invite_token]

			  if @token != nil
			     group =  Invite.find_by_token(@token).group #find the organization attached to the invite
			     @newUser.groups.push(group) #add this user to the new organization as a member
			  else
			    # do normal registration things #
			  end
	end

end