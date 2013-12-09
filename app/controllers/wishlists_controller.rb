class WishlistsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @wishlists = Wishlist.where(user_id: @user.id)
  end

  def show
    @wishlist = Wishlist.find(params[:id])
  end

  def new
    @wishlist = Wishlist.new
  end

  def create
    @wishlist = Wishlist.new(wishlist_params.merge!({user_id: current_user.id}))
    @wishlist.save

    redirect_to user_wishlist_path(current_user, @wishlist)
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:id, :name)
  end

end
