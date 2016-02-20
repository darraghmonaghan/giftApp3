class GroupsController < ApplicationController
  def index
  end

  def show
  	@group = Group.find(params[:id])
  end

  def new
  	@group = Group.new
  end


  def create
    @group = Group.create(group_params)
    #Membership.create(:user_id => @group.user_id, :group_id => @group.id)

      if @group.save
        redirect_to groups_show_path(@group.id)
      else
        redirect_to root_path
      end
  end

private

  def group_params
    params.require(:group).permit(:title, :description, :date, :time, :user_id)  
  end



end
