class GroupsController < ActionController::Base
  before_action :authenticate_user!

  def new
    @group = Group.new
  end

  def index
    @categories = Group.where(user: current_user)
  end

  def create
    @group = Group.new(group_params)
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

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end
end
