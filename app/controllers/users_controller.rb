class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
    @photos = @user.photos.order(:created_at).page(params[:page]).per_page(5)
  end

end
