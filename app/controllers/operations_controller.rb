class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @operation = Operation.new
  end

  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations.order('created_at DESC')
    @total = @operations.sum(:amount)
  end

  def create
    @group = Group.find(params[:group_id])
    @operation = current_user.operations.build(operation_params)

    if @operation.save
      @operation.groups << groups(@group)
      redirect_to group_operations_path(@group)
    else
      render :new
    end
  end

  private

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def groups(default_group)
    groups = [default_group]

    groups << Group.where(id: params[:operation][:group_ids])
    groups.flatten
  end
end
