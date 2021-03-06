class GroupsController < ApplicationController


  def index
  end


  def stripe
    @user = current_user

    if @user.publishable_key === nil
         render 'stripe'
    else
        redirect_to groups_new_path
    end
  end



  def show
    if current_user === nil
        redirect_to root_path
    end
      
    memberships = []
    current_user.memberships.each do | a |
          memberships.push(a.group_id)
    end

    @user_votes = []
    current_user.votes.each do | b |
          @user_votes.push(b.gift_id)
    end


    @group = Group.find(params[:id])

  	if memberships.include? (@group.id)
          @vote = Vote.new
          @post = Post.new
          @founder = User.find(@group.user_id)
          @members = Membership.where(:group_id => @group.id)
    else
          redirect_to dashboard_index_path
    end

    @members = []


  end


  def new
    if current_user === nil
      redirect_to dashboard_index_path
    else
      @group = Group.new
    end
  end



  def create
    @group = Group.create(group_params)
    Membership.create(:user_id => @group.user_id, :group_id => @group.id)

      if @group.save
        redirect_to invites_new_path(@group.id)
      else
        redirect_to root_path
      end
  end


  def edit
    if current_user === nil
        redirect_to root_path
    end

    @group = Group.find(params[:id])

    if current_user.id != @group.user_id
        redirect_to dashboard_index_path
    end
  end


  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to :action => 'show', :id => @group.id
    end
  end


  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to dashboard_index_path
  end


private

  def group_params
    params.require(:group).permit(:title, :description, :date, :target, :user_id)  
  end



end
