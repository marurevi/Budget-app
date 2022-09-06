class SplashController < ActionController::Base
  def index
    redirect_to home_path if user_signed_in?
  end
end
