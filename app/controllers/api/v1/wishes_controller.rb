class Api::V1::WishesController < ApplicationController
  before_action :authorized, only: [:index,:create, :update, :destroy]
  
  # def index
    
  #   wishList = User.find(current_user).wishes

  #   render json: wishList
  # end

  def create
    
    # user_id: current_user[:id], item_description: params[:item_description], item_link: params[:item_link], item_rank: params[:item_rank], item_image: params[:item_image], item_price: params[:item_price]
  	@wish = Wish.new(wish_params)
    @wish.user = current_user
  	@wish.save

    wishList = Wish.where("user_id = #{@wish.user_id}")
    render json: wishList

  end

  def show
    wishList = User.find(params[:id]).wishes

    render json: wishList
  end

  def update

  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy()

    wishList = Wish.where("user_id = #{@wish.user_id}")
    render json: wishList
  end



  private

  def wish_params
  	params.require(:wish).permit(:item_description, :item_link, :item_rank, :item_image, :item_price)
  end

end
