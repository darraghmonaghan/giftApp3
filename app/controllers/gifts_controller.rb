class GiftsController < ApplicationController

  def new
  	@gift = Gift.new
  end

  def create
  	@gift = Gift.create(gift_params)
  	if @gift.save
  		redirect_to groups_show_path(@gift.group_id)
  	end
  end


  def show
    @gift = Gift.find(params[:id])
    @group = Group.find(params[:group_id])
  end


  def amazon

        require 'httparty'
        require 'openssl'
        require "base64"

        @Access_Key_ID = 'AKIAJZQPTSKJ4L53OS4A'
        @Secret_Access_Key = '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'
        @Amazon_Associates_ID = 'wes00-21'
        @Search = params[:data][:search]      ## Need to double check 
        @Timestamp = DateTime.now.iso8601

        url = http://webservices.amazon.com/onca/xml?Service=AWSECommerceService&AWSAccessKeyId=@Access_Key_ID&AssociateTag=@Amazon_Associates_ID&Operation=ItemSearch&Keywords=@Search&Timestamp=@Timestamp


        secret_key = '1234567890'
        sha256 = OpenSSL::Digest::SHA256.new
        sig = OpenSSL::HMAC.digest(sha256, secret_key, url)     ## is the Secret Access Key Used instead?
        signature = Base64.encode64(sig)

        signed_request = url + '&Signature=' + signature


        # target_url = 'http://api.openweathermap.org/data/2.5/forecast/daily?q=' + @city_search + '&units=' + @unit + '&cnt=16&APPID=' + @apiKey
        # response = HTTParty.get(target_url)







  end


private

  def gift_params
    params.require(:gift).permit(:title, :description, :price, :URL, :group_id, :user_id, :avatar)  
  end

end
