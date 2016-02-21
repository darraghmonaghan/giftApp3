class InviteMailer < ApplicationMailer

	default from: 'noreply@ourgift.com'

	def group_invite(invite, url)
		@invite = invite
		@url = url
		mail(to: @invite.email, subject: 'Welcome, you have an event invite!')
	end


	def invite_existing_user(invite)
		@invite = invite
		mail(to: @invite.email, subject: 'Welcome, you have an event invite!')
	end

end
