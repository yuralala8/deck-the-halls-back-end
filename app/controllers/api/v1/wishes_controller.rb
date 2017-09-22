class Api::V1::WishesController < ApplicationController
  before_action :authorized, only: [:index,:create, :update, :destroy]
  
  def index
    
    wishList = Wish.where("user_id = #{current_user[:id]}")

    render json: wishList
  end

  def create
  
  	@wish = Wish.new(user_id: current_user[:id], item_name: params[:item_name], item_description: params[:item_description], item_link: params[:item_link], item_rank: params[:item_rank], item_image: params[:item_image], item_price: params[:item_price])

  	@wish.save

    wishList = Wish.where("user_id = #{@wish.user_id}")
     
    render json: wishList

  end

  def update

  end

  def destroy

  end



  private

  def wish_params
  	params.require(:wish).permit(:item_name, :item_description, :item_link, :item_rank, :item_image, :item_price)
  end

end
