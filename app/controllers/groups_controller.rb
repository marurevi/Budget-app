class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @categories = Group.where(user: current_user)
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
