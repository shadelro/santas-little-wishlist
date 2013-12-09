class WishesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @wishes = Wish.all
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @wishlist = Wishlist.find(params[:wishlist_id])
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params.merge!({user_id: params[:user_id], wishlist_id: params[:wishlist_id]}))
    @wish.save

    redirect_to user_wishlist_path(params[:user_id], params[:wishlist_id])
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    @wish.update_attributes(wish_params)

    redirect_to user_wishlist_path(params[:user_id], params[:wishlist_id])
  end

  private

  def wish_params
    params.require(:wish).permit(:id, :name, :description, :link, :bought)
  end

end
