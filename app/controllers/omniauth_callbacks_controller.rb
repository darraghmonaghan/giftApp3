class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    puts 'OmniauthCallbacksController Reached!!!!!..............!!!!!!!'
    @user = current_user
    if @user.update_attributes({
      provider: request.env["omniauth.auth"].provider,
      uid: request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
      puts 'Attributes being updated!!!!!..........!!!!!'
    })
      # anything else you need to do in response..
      sign_in_and_redirect @user, :event => :authentication
      # set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


end
