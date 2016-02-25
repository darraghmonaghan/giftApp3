class PaymentsController < ApplicationController

  
  protect_from_forgery with: :null_session


  def new
  end

  def create
  	puts 'params here:'
  	puts params[:stripeToken]
  	puts params[:stripeTokenType]
  	puts params[:stripeEmail]
  	puts '___________________________'

		# Stripe.api_key = "sk_test_vGMPaW1vKvvvu5KFZzazu4rQ"

		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => 1000, # amount in cents, again
		    :currency => "gbp",
		    :source => token,
		    :description => "Example charge"
		  )
		rescue Stripe::CardError => e
		  # The card has been declined
		end


private

  def payment_params
    params.require(:stripe).permit(:stripeToken, :stripeTokenType, :stripeEmail)  
  end


  end
end
