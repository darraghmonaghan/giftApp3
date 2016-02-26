class InvitesController < ApplicationController
  
  def new
  	# @invite = Invite.new
  end


  def create
  	invite_addresses = []
  	group_id = params[:invite][:group_id]

  	if params[:invite][:email1] != '' 
        invite_addresses.push(params[:invite][:email1])
  	end

    if params[:invite][:email2] != '' 
        invite_addresses.push(params[:invite][:email2])
  	end

    if params[:invite][:email3] != '' 
        invite_addresses.push(params[:invite][:email3])
  	end

    if params[:invite][:email4] != '' 
        invite_addresses.push(params[:invite][:email4])
  	end

    if params[:invite][:email5] != '' 
        invite_addresses.push(params[:invite][:email5])
    end


  	invite_addresses.each do | email |

			invite = Invite.new(email: email, group_id: group_id)            # Make a new Invite
			invite.sender_id = current_user.id                               # set the sender to the current user
			   
			   if invite.save
			  
			   	  	if invite.recipient != nil									             # If the person inviting is already signed up
				   	  	InviteMailer.invite_existing_user(invite).deliver_now	 # Version 1 of email sent
						invite.recipient.groups.push(invite.group)			           # Updating the membership list of the existing user - add the group in question

				  	else
					    InviteMailer.group_invite(invite, new_user_registration_path(:invite_token => invite.token)).deliver_now #send the invite data to our mailer to deliver the email
					end
			   # else
			      # REDIRECT ???
			   end

  	end
		redirect_to groups_show_path(group_id)
  end


private


  def invite_params
    params.require(:invite).permit(:group_id, :email1, :email2, :email3, :email4, :email5)  
  end


  def email_params
  	params.require(:email).permit()
  end


end
