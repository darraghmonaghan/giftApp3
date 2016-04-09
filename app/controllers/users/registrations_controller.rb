class Users::RegistrationsController < Devise::RegistrationsController


	def new
		super do
			@token = params[:invite_token]
		end
	end


	def create

	    super do |user|
	      token = params[:invite_token]

		      if token.present?
		        invite = Invite.find_by_token(token)

			        if invite.present?
			          Membership.create(user_id: user.id, group_id: invite.group.id)
			        end
		      end
	    end
	end


	private :resource_params
		def resource_params
		    params.require(:user).permit(:email, :firstname, :surname, :password, :password_confirmation, :current_password, :phone)
		end

end