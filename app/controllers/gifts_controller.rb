class GiftsController < ApplicationController

  def new
  	# @gift = Gift.new
    render :amazon

  end

  def create
  	@gift = Gift.create(gift_params)
  	if @gift.save
  		redirect_to groups_show_path(@gift.group_id)
  	end
  end





  def amazonSearch
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
      'ResponseGroup' => "ItemAttributes,Images"
    }

    raw_response = request.item_search(query: params)
    @hashed_products = raw_response.to_h

    @hashed_products['ItemSearchResponse']['Items']['Item'].each do |item|
        product = OpenStruct.new
        product.name = item['ItemAttributes']['Title']
        product.image = item['MediumImage']['URL']
        product.id = item['ItemAttributes']['ASIN']
        product.url = item['ItemAttributes']['DetailPageURL']
        product.description = item['ItemAttributes']['Feature']        
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
