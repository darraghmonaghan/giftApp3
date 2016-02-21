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


private

  def gift_params
    params.require(:gift).permit(:title, :description, :price, :URL, :group_id, :user_id, :avatar)  
  end

end
