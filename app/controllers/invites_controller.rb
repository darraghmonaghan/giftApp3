class InvitesController < ApplicationController
  
  def new
  	@invite = Invite.new
  end


  def create
		@invite = Invite.new(invite_params) # Make a new Invite
		@invite.sender_id = current_user.id # set the sender to the current user
		   
		   if @invite.save
		  
		   	  	if @invite.recipient != nil									# If the person inviting is already signed up
			   	  	InviteMailer.invite_existing_user(@invite).deliver_now	# Version 1 of email sent
					@invite.recipient.groups.push(@invite.group)			# Updating the membership list of the existing user - add the group in question

			  	else
				    InviteMailer.group_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver_now #send the invite data to our mailer to deliver the email
				end
		   # else
		      # REDIRECT ???
		   end
		   redirect_to groups_show_path(@invite.group)
  end


private

  def invite_params
    params.require(:invite).permit(:group_id, :email)  
  end


end
