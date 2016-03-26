class GiftsController < ApplicationController

  def new
    @group = Group.find(params[:id])
    render :amazon
  end


  def create
  	@gift = Gift.create(gift_params)
  	if @gift.save
  		redirect_to groups_show_path(@gift.group_id)
  	end
  end


  def amazonSearch

    @group = Group.find(params[:id])

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
        product.Title = item['ItemAttributes']['Title']
        product.image = item['MediumImage']['URL']
        product.ASIN = item['ASIN']
        product.URL = item['DetailPageURL']
        # product.purchaseURL = item['purchaseURL']
        product.Feature = item['ItemAttributes']['Feature']
        product.Price = item['OfferSummary']['LowestNewPrice']['FormattedPrice'] 
        product.Summar = item['OfferSummary']['LowestNewPrice']['FormattedPrice'] 

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
