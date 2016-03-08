class Users::RegistrationsController < Devise::RegistrationsController


	def new
		super do
			@token = params[:invite_token]
		end
	end


	def create
		super do
			@newUser = User.create(resource_params)
			@newUser.save
			@token = params[:invite_token]

					  if @token != nil
					     @group = Invite.find_by_token(@token).group #find the organization attached to the invite
					     # @newUser.memberships.push(@group) #add this user to the new organization as a member
					     Membership.create(:user_id => @newUser.id, :group_id => @group.id)
					  end
			end
	end



	private :resource_params
		def resource_params
		    params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
		end


end