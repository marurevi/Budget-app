class OperationsController < ApplicationController
  before_action :authenticate_user!

  def new; end
  def index; end

  private

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end
end
