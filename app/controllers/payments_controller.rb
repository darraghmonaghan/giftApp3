class PaymentsController < ApplicationController

	skip_before_filter  :verify_authenticity_token


	def new
		@group = Group.find(params[:id])
		group_owner_id = @group.user_id
		group_owner = User.find(group_owner_id)
		@owner_publishable_key = group_owner.publishable_key
	end

	def create
		  @group = Group.find(params[:id])
		  
		  # Amount in Pence - required for Stripe payments
		  @amount = 1000
		  # Amount in Sterling - required for Group Update
		  @amount2 = (@amount / 100)

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

		@group = Group.find(params[:id])
			if @group.current === nil
				new_amount = @amount2
			else
				new_amount = (@group.current += @amount2)				
			end
		@group.current = new_amount
		@group.save

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
		end


end