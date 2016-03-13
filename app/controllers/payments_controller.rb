class PaymentsController < ApplicationController

	skip_before_filter  :verify_authenticity_token


	def new
		@group = Group.find(params[:id])
		group_owner_id = @group.user_id
		group_owner = User.find(group_owner_id)
		@owner_publishable_key = group_owner.publishable_key
		puts 'OWNER publishable_key HERE!!!'
		puts @owner_publishable_key
	end

	def create
		  @group = Group.find(params[:id])
		  


		  # Amount in cents
		  @amount = 1000

		  customer = Stripe::Customer.create(
		    :email => params[:stripeEmail],
		    :source  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'gbp'
		  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
		end


end