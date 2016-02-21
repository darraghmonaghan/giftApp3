class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@ourgift.com'
  layout 'mailer'

 #  before(:each) do
 #    ActionMailer::Base.delivery_method = :test
 #    ActionMailer::Base.perform_deliveries = true
 #    ActionMailer::Base.deliveries = []
 #    @invite = Factory.create(:invite)
 #    EbookConfirmationMailer.confirmation_email(@invite).deliver
 #  end

	# after(:each) do
	#   ActionMailer::Base.deliveries.clear
	# end


end