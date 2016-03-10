class HomeController < ApplicationController


	def show

	end

	def index
		if user_signed_in?
			redirect_to :controller => 'dashboard', :action => 'index'
		else
			redirect_to :controller => 'home', :action => 'show'
		end
	end


	def about
	end

	def faq
	end

	def contact
	end

	def sendMessage
  		sender_name = params[:message][:name]
  		sender_email = params[:message][:email]
  		topic = params[:message][:topic]
  		content = params[:message][:content]

		InviteMailer.contact_message(sender_name, sender_email, topic, content).deliver_now
		redirect_to root_path
	end


	private

	  def message_params
	    params.require(:message).permit(:name, :email, :topic, :content)  
	  end



end