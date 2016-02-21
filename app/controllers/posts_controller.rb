class PostsController < ApplicationController

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.create(post_params)
  	if @post.save
  		redirect_to groups_show_path(@post.group_id)
  	end

  end


private
  def post_params
    params.require(:post).permit(:group_id, :user_id, :content)  
  end


end
