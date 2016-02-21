class VotesController < ApplicationController
  def new
  end

  def create
  	@vote = Vote.create(vote_params)
  	redirect_to :back
  end


private
  def vote_params
    params.require(:vote).permit(:gift_id, :user_id)  
  end

end
