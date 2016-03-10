class InviteMailer < ApplicationMailer

	default from: 'noreply@weshallgift.com'

	def group_invite(invite, url)
		@invite = invite
		@inviter = User.find(@invite.sender_id)
		@group = Group.find(@invite.group_id)
		@url = url
		subject_title = (@inviter.firstname + ' is arranging a group gift for ' + @group.title)
		mail(to: @invite.email, subject: subject_title)
	end


	def invite_existing_user(invite)
		@invite = invite
		@inviter = User.find(@invite.sender_id)
		@group = Group.find(@invite.group_id)
		@invitee = User.find_by_email(@invite.email)

		subject_title = (@inviter.firstname + ' is arranging a group gift for ' + @group.title)
		mail(to: @invite.email, subject: subject_title)
	end

end
