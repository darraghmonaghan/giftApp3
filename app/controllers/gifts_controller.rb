class GiftsController < ApplicationController

  def new
    if current_user
      @group = Group.find(params[:id])
    end
    render :amazon
  end


  def create
    require 'rubygems'
    require 'twilio-ruby'

    group = Group.find(params[:gift][:group_id])
    user_SMS = []


    #### Consolidating User Phone Numbers ####
    group.users.each do | user |
      user_SMS.push(user.phone)
    end

    puts 'Array of SMS numbers HERE'
    puts user_SMS


    #### Twilio SMS sending ####
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    my_twilio_number = '+441934446036'

    user_SMS.each do | number |
        if (number != nil) 
            client.account.messages.create(
                :from => my_twilio_number,
                :to => number,
                :body => ('Somebody just suggested a new gift idea for ' + group.title + ', checkout it out at WeShallGift!')
            )
            puts 'SMS sent.......'
        end
    end


  	@gift = Gift.create(gift_params)
  	if @gift.save
  		redirect_to groups_show_path(@gift.group_id)
  	end
  end


  def amazonSearch
    if params[:id] != '0'
      @group = Group.find(params[:id])
    end

    search_phrase = params[:gift][:searchItem]
    request = Vacuum.new('GB')
    @products = []

    request.configure(
        aws_access_key_id: ENV['AMAZON_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AMAZON_SECRET_ACCESS_KEY'],
        associate_tag: 'tag'
    )

    params = {
      'SearchIndex' => 'All',
      'Keywords'=> search_phrase,
      'ResponseGroup' => "ItemAttributes,Images,OfferSummary"
    }

    raw_response = request.item_search(query: params)
    @hashed_products = raw_response.to_h

    @hashed_products['ItemSearchResponse']['Items']['Item'].each do |item|
        product = OpenStruct.new
        product.Title = item.try(:[], 'ItemAttributes').try(:[], 'Title')
        product.image = item.try(:[], 'MediumImage').try(:[], 'URL')
        product.ASIN = item.try(:[], 'ASIN')
        product.URL = item.try(:[], 'DetailPageURL')
        product.Feature = item.try(:[], 'ItemAttributes').try(:[], 'Feature')
        product.Price = item.try(:[], 'OfferSummary').try(:[], 'LowestNewPrice').try(:[], 'FormattedPrice')
        @products << product
    end
    render :amazon
  end



  def show
    @gift = Gift.find(params[:id])
    @group = Group.find(params[:group_id])
  end


private

  def gift_params
    params.require(:gift).permit(:title, :description, :price, :URL, :group_id, :user_id, :avatar)  
  end

end
